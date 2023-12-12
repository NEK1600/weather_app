import 'dart:convert';

import 'package:weather_app/domain/weather.dart';

abstract interface class Serialization<T> {
  T fromJson(String json);
}
abstract interface class Encoding {
  Map<String, dynamic> decode(dynamic data);
}

class SerializationWeather implements Serialization<Weather> {
  final Encoding encoding;
  SerializationWeather({required this.encoding});
  @override
  Weather fromJson(String json) {
    List<HourWeather> listHour = [];
    final jsonOneLayer = encoding.decode(json);
    final List<dynamic> jsonListTwoLayer = jsonOneLayer["hourly"];
    jsonListTwoLayer.map((e) {
      final List<dynamic> jsonListThreeLayer = e["weather"];
      listHour.add(
        HourWeather(
          dt: e["dt"],
          temp: e["temp"],
          humidity: e["humidity"],
          windSpeed: e["wind_speed"],
          main: jsonListThreeLayer[0]["main"]
        )
      );
    }).toList();
    return Weather(hourly: listHour, timezone: jsonOneLayer["timezone"]);
  }
}

class EncodingBase implements Encoding {
  @override
  Map<String, dynamic> decode(dynamic data) {
    final dataDecode = jsonDecode(data) as Map<String, dynamic>;
    return dataDecode;
  }
}
