import 'package:weather_app/domain/interactor/weather_interactor.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/weather.dart';

import 'fake_weather.dart';

class FakeWeatherInteractor implements WeatherInteractor {
  int callResponseWeather = 0;
  int callBaseIcon = 0;
  int callHumidity = 0;
  int callWind = 0;
  @override
  Future<Weather> responseWeather(LocationBase location) async {
    callResponseWeather++;
    return FakeWeather().weather();
  }

  @override
  String baseIcon(Weather weather) {
    callBaseIcon++;
    return "";
  }

  @override
  String humidity(Weather weather) {
    callHumidity++;
    return "";
  }
  @override
  String wind(Weather weather) {
    callWind++;
    return "";
  }
}
