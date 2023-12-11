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

    test('city(Weather)', () {
      String city = weatherInteractor.city(FakeWeather().weather());
      expect(city, "America/Chicago");
    });

    test('baseIcon(Weather)', () {
      String baseIcon = weatherInteractor.baseIcon(FakeWeather().weather());
      expect(baseIcon, "precipitation_up");
    });

    test('currentTemp(Weather)', () {
      String currentTemp = weatherInteractor.currentTemp(FakeWeather().weather());
      expect(currentTemp, "18");
    });

    test('icons(Weather)', () {
      List<String> icons = weatherInteractor.icons(FakeWeather().weather());
      expect(icons[0], "cloudy_min");
    });

    test('temps(Weather)', () {
      List<String> temps = weatherInteractor.temps(FakeWeather().weather());
      expect(temps[0], "18");
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
