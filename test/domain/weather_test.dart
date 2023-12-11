import 'package:flutter_test/flutter_test.dart';

void main() {
  group('working with data WeatherBase', () {
    late WeatherBase weatherBase;
    setUp(() {
      weatherBase = WeatherBase(
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
      expect(day, "24 May");
    });

    test('Get list time. from unix in date time', () {
      final times = weatherBase.times();
      expect(times[0], "11:00");
    });

    test('Get temps. from calvin in celsius', () {
      final temps = weatherBase.temsp();
      expect(temps[0], "18");
    });

    test('Get icon from main', () {
      final icon = weatherBase.baseIcon();
      expect(icon, "precipitation_up");
    });

    test('Get icons from main', () {
      final icons = weatherBase.icons();
      expect(icons[0], "cloudy_min");
      expect(icons[1], "thunderstorm_min");
    });

    test('Get humidity character', () {
      final humidity = weatherBase.humidity();
      expect(humidity, "высокая влажность");
    });

    test('Get wind character', () {
      final wind = weatherBase.wind();
      expect(wind, "слабый ветер");
    });
  });
}
