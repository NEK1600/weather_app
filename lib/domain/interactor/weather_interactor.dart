import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/cache_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/weather.dart';

abstract interface class WeatherInteractor {
  Future<Weather> responseWeather(LocationBase location);
  String humidity(Weather weather);
  String wind(Weather weather);
  String baseIcon(Weather weather);
}

class WeatherInteractorBase implements WeatherInteractor {
  final WeatherRepository weatherRepository;
  final CacheRepository<Weather> cacheWeather;
  WeatherInteractorBase({
    required this.weatherRepository,
    required this.cacheWeather,
  });

  @override
  Future<Weather> responseWeather(LocationBase location) async {
    try {
      final response = await weatherRepository.responseWeather(location);
      cacheWeather.save(response, "weather");
      return response;
    } on ConnectError {
      return cacheWeather.cache("weather");
    }
  }

  @override
  String baseIcon(Weather weather) {
    final String firstIcon = weather.icons()[0];
    return "${firstIcon}_up";
  }

  @override
  String humidity(Weather weather) {
    return weather.hourly[0].humidityCharacter();
  }

  @override
  String wind(Weather weather) {
    return weather.hourly[0].windCharacter();
  }
}
