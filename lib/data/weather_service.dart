import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/core/fake_json.dart';

abstract interface class WeatherService {
  Future<String> responseWeather(String lat, String long);
}

class WeatherServiceBase implements WeatherService {
  final http.Client client;
  WeatherServiceBase({required this.client});
  @override
  Future<String> responseWeather(String lat, String long) async {
    try {
      final urlParse = Uri.parse(
          "https://api.openweathermap.org/data/3.0/onecall?lat=${lat}&lon=${long}&exclude=hourly,daily&appid={API key}");
      http.Response response = await client.get(urlParse);
      return response.body;
    } on SocketException {
      throw ConnectError();
    }
  }
}

class WeatherServiceMock implements WeatherService {
  @override
  Future<String> responseWeather(String lat, String long) async {
    return FakeJson.json;
  }
}
