import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/weather.dart';

abstract interface class WeatherRepository {
  Future<Weather> responseWeather(LocationBase location);
}
