import 'dart:convert';

import 'package:weather_app/data/cache_service.dart';
import 'package:weather_app/domain/repositories/cache_repository.dart';
import 'package:weather_app/domain/weather.dart';

class CacheWeatherBase implements CacheRepository<Weather> {
  final CacheService cacheService;
  CacheWeatherBase({required this.cacheService});
  @override
  Weather cache(String key) {
    final List<HourWeather> list = [];
    final cacheData = jsonDecode(cacheService.cache(key));
    final List<dynamic> listCache = cacheData["hourly"];
    listCache.map((e){
      list.add(HourWeather(
          dt: e["dt"],
          temp: e["temp"],
          humidity: e["humidity"],
          windSpeed: e["windSpeed"],
          main: e["main"])
      );
    }).toList();
    final data = Weather(
        hourly: list,
        timezone: cacheData["timezone"],
    );
    return data;
  }

  @override
  Future save(Weather data, String key) async {
    List<Map<String, dynamic>> list = [];
    data.hourly.map((e) {
       list.add({
         "dt": e.dt,
         "temp": e.temp,
         "humidity" : e.humidity,
         "windSpeed": e.windSpeed,
         "main": e.main,
       });
    }).toList();
    Map<String, dynamic> map = {
      "timezone": data.timezone,
      "hourly": list
    };
    await cacheService.save(key, jsonEncode(map));
  }
}
