import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

void main() {
  group('save state', () {
    late WeatherPageStateBase weatherPageState;
    setUp(() {
      weatherPageState = WeatherPageStateBase();
    });
    test("initial state", () {
      final initial = weatherPageState.uiData();
      expect(initial.location, "");
      expect(initial.bigBaseIcon, "");
      expect(initial.weatherHours[0].temp, "");
    });

    test("emit state", () {
      final initial = weatherPageState.emit(WeatherUiData(
          location: "location",
          bigBaseIcon: "bigBaseIcon",
          weatherHours: [
            WeatherHours(

            ),
          ],
          currentWeather: "currentWeather",
          wind: Wind(),
          humidity: Humidity())
      );
      expect(initial.location, "location");
      expect(initial.bigBaseIcon, "");
      expect(initial.weatherHours[0].temp, "");
    });
  });
}
