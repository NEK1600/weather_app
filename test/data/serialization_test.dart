import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/fake_json.dart';
import 'package:weather_app/data/serialization.dart';
import 'package:weather_app/domain/weather.dart';

void main() {
  group('serialization', () {
    late SerializationWeather serializationWeather;
    EncodingBase encodingBase = EncodingBase();
    setUpAll(() {
      serializationWeather = SerializationWeather(
          encoding: encodingBase
      );
    });
    test('fromJson', () {
      final Weather data = serializationWeather.fromJson(FakeJson.json);
      expect(data.timezone, "America/Chicago");
      expect(data.hourly[0].windSpeed, 2.58);
      expect(data.hourly[1].main, "Clouds");
      expect(data.hourly[2].main, "Thunderstorm");
      expect(data.hourly[3].main, "Clouds");
    });
  });
}
