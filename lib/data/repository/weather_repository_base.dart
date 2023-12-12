import 'package:weather_app/data/serialization.dart';
import 'package:weather_app/data/weather_service.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/weather.dart';

class WeatherRepositoryBase implements WeatherRepository {
  Serialization<Weather> serialization;
  WeatherService weatherService;
  WeatherRepositoryBase({
    required this.serialization,
    required this.weatherService,
  });
  @override
  Future<Weather> responseWeather(LocationBase location) async {
    final response = await weatherService.responseWeather(location.lat.toString(), location.long.toString());
    final map = serialization.fromJson(response);
    return map;
  }
}
