import 'package:weather_app/domain/weather.dart';

class FakeWeather {
  Weather weather() {
    return const WeatherBase(
        timezone: "fake city",
        hourly: [
          HourWeatherBase(
            dt: 1684926000,
            temp: 292.01,
            humidity: 91,
            windSpeed: 2.58,
            main:"Clouds",
          ),
          HourWeatherBase(
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
