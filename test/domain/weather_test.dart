import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/weather.dart';

void main() {
  group('working with data WeatherBase', () {
    late Weather weatherBase;
    setUp(() {
      weatherBase = const Weather(
        timezone: "fake city",
        hourly: [
          HourWeather(
            dt: 1684926000,
            temp: 292.01,
            humidity: 91,
            windSpeed: 2.58,
            main:"Clouds",
          ),
          HourWeather(
            dt: 1684926000,
            temp: 292.01,
            humidity: 20,
            windSpeed: 2.58,
            main:"Thunderstorm",
          ),
        ]
      );
    });

    test('Get day. from unix in date time', () {
      final day = weatherBase.day();
      expect(day, "24 may");
    });

    test('Get list time. from unix in date time', () {
      final times = weatherBase.times();
      expect(times[0], "11:00");
    });

    test('Get temps. from calvin in celsius', () {
      final temps = weatherBase.temps();
      expect(temps[0], "18");
    });

    test('Get icons from main', () {
      final icons = weatherBase.icons();
      expect(icons[0], "cloudy");
      expect(icons[1], "thunderstorm");
    });

    test('Get humidity character', () {
      const hourWeatherBase = HourWeather(
        dt: 1684926000,
        temp: 292.01,
        humidity: 91,
        windSpeed: 2.58,
        main:"Clouds",
      );
      final humidity = hourWeatherBase.humidityCharacter();
      expect(humidity, "высокая влажность");
    });

    test('Get wind character', () {
      const hourWeatherBase = HourWeather(
        dt: 1684926000,
        temp: 292.01,
        humidity: 91,
        windSpeed: 2.58,
        main:"Clouds",
      );
      final wind = hourWeatherBase.windCharacter();
      expect(wind, "слабый ветер");
    });
  });
}
