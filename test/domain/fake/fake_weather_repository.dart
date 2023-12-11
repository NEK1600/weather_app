import 'package:weather_app/core/exception_throw.dart';

import '../../presentation/fake/fake_weather.dart';

class FakeWeatherRepository implements WeatherRepository {
  int callResponseWeather = 0;
  bool throwConnectError = false;
  @override
  Future<Weather> responseWeather() {
    callResponseWeather++;
    if(throwConnectError) {
      throw ConnectError();
    }
   return FakeWeather().weather();
  }
}