import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/weather.dart';

abstract interface class WeatherInteractor {
  Future<Weather> responseWeather(LocationBase location);
  String city(Weather weather);
  List<String> icons(Weather weather);
  List<String> temps(Weather weather);
  String humidity(Weather weather);
  String wind(Weather weather);
  String baseIcon(Weather weather);
  String currentTemp(Weather weather);
}

class WeatherInteractorBase implements WeatherInteractor {
  final WeatherRepository weatherRepository;
  final CacheWeatherRepository cacheWeather;
  WeatherInteractorBase({
    required this.weatherRepository,
    required this.cacheWeather,
  });
  @override
  String baseIcon(Weather weather) {
    // TODO: implement baseIcon
    throw UnimplementedError();
  }

  @override
  String city(Weather weather) {
    // TODO: implement city
    throw UnimplementedError();
  }

  @override
  String humidity(Weather weather) {
    // TODO: implement humidity
    throw UnimplementedError();
  }

  @override
  List<String> icons(Weather weather) {
    // TODO: implement icons
    throw UnimplementedError();
  }

  @override
  Future<Weather> responseWeather(LocationBase location) {
    // TODO: implement responseWeather
    throw UnimplementedError();
  }

  @override
  List<String> temps(Weather weather) {
    // TODO: implement temps
    throw UnimplementedError();
  }

  @override
  String wind(Weather weather) {
    // TODO: implement wind
    throw UnimplementedError();
  }

}
