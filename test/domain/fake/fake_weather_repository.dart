import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/weather.dart';

import '../../presentation/fake/fake_weather.dart';

class FakeWeatherRepository implements WeatherRepository {
  int callResponseWeather = 0;
  bool throwConnectError = false;

  @override
  Future<Weather> responseWeather(LocationBase location) async {
    callResponseWeather++;
    if(throwConnectError) {
      throw ConnectError();
    }
    return FakeWeather().weather();
  }
}
