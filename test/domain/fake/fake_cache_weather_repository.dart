import 'package:weather_app/domain/repositories/cache_repository.dart';
import 'package:weather_app/domain/weather.dart';

import '../../presentation/fake/fake_weather.dart';

class FakeCacheWeatherRepository implements CacheRepository<Weather> {
  int callCache = 0;
  int callSave = 0;
  @override
  Weather cache(String key) {
    callCache++;
    return FakeWeather().weather();
  }

  @override
  Future save(Weather data, String key) async {
    callSave++;
  }
}