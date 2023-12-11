import 'package:weather_app/domain/weather.dart';

class FakeWeather {
  Weather weather() {
    return const Weather(
        timezone: "America/Chicago",
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
  }
}
