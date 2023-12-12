import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/fake_json.dart';
import 'package:weather_app/data/cache_service.dart';
import 'package:weather_app/data/repository/cache_weather_base.dart';

import '../../presentation/fake/fake_weather.dart';

void main() {
  group('mapper', () {
    late CacheWeatherBase cacheWeatherBase;
    late FakeCacheService cacheService;
    setUp(() {
      cacheService = FakeCacheService();
      cacheWeatherBase = CacheWeatherBase(cacheService: cacheService);
    });
    test('mapping', () async {
      await cacheWeatherBase.save(FakeWeather().weather(), "key");
      final data = cacheWeatherBase.cache("key");
      expect(data.hourly[0].main, "Clouds");
    });
  });
}

class FakeCacheService implements CacheService {
  String dataCache = "";
  @override
  String cache(String key) {
    return dataCache;
  }

  @override
  Future save(String key, String data) async {
    dataCache = data;
  }
}