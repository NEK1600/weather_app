import 'fake_weather.dart';

class FakeWeatherInteractor implements WeatherInteractor {
  int callResponseWeather = 0;
  int callCity = 0;
  int callBaseIcon = 0;
  int callIcons = 0;
  int callTemps = 0;
  int callHumidity = 0;
  int callWind = 0;
  @override
  Future<Weather> responseWeather(Location location) async {
    callResponseWeather++;
    return FakeWeather().weather();
  }

  @override
  String city(Weather weather) {
    callCity++;
    return "";
  }
  @override
  String baseIcon(Weather weather) {
    callBaseIcon++;
    return "";
  }
  @override
  List<String> icons(Weather weather) {
    callIcons++;
    return [""];
  }
  @override
  List<String> temps(Weather weather) {
    callTemps++;
    return [""];
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
