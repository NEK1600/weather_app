import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/interactor/weather_interactor.dart';
import 'package:weather_app/domain/location.dart';

import '../../presentation/fake/fake_weather.dart';
import '../fake/fake_cache_weather_repository.dart';
import '../fake/fake_weather_repository.dart';

void main() {
  group('call fun', () {
    late WeatherInteractorBase weatherInteractor;
    late FakeWeatherRepository weatherRepository;
    late FakeCacheWeatherRepository cacheWeather;
    setUp(() {
      weatherRepository = FakeWeatherRepository();
      cacheWeather = FakeCacheWeatherRepository();
      weatherInteractor = WeatherInteractorBase(
        cacheWeather: cacheWeather,
        weatherRepository: weatherRepository,
      );
    });

    test('responseWeather(). save cache', () async {
      await weatherInteractor.responseWeather(LocationBase(lat: 0, long: 0));
      expect(weatherRepository.callResponseWeather, 1);
      expect(cacheWeather.callSave, 1);
    });

    test('responseWeather(). connectError -> call cache', () async {
      weatherRepository.throwConnectError = true;
      await weatherInteractor.responseWeather(LocationBase(lat: 0, long: 0));
      expect(cacheWeather.callCache, 1);
    });

    test('baseIcon(Weather)', () {
      String baseIcon = weatherInteractor.baseIcon(FakeWeather().weather());
      expect(baseIcon, "cloudy_up");
    });

    test('humidity(Weather)', () {
      String humidity = weatherInteractor.humidity(FakeWeather().weather());
      expect(humidity, "высокая влажность");
    });

    test('wind(Weather)', () {
      String wind = weatherInteractor.wind(FakeWeather().weather());
      expect(wind, "слабый ветер");
    });
  });
}
