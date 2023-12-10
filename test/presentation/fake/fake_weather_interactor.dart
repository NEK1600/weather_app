import 'fake_weather.dart';

class FakeWeatherInteractor implements WeatherInteractor {
  int callResponseWeather = 0;
  @override
  Future<Wether> responseWeather() async {
    callResponseWeather++;
    //TODO обращение к локации
    //TODO сохранение entities в кеше
    return FakeWeather().weather();
  }
}