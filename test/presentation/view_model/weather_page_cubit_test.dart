import 'package:flutter_test/flutter_test.dart';

import '../fake/fake_weather_interactor.dart';
import '../fake/fake_weather_page_state.dart';

void main() {
  group("all", () {
    late WeatherPageCubit weatherPageCubit;
    late FakeWeatherInteractor weatherInteractor;
    late FakeWeatherPageState pageState;
    setUp(() {
      weatherInteractor = FakeWeatherInteractor();
      pageState = FakeWeatherPageState();
      weatherPageCubit = WeatherPageCubit(
        weatherInteractor: weatherInteractor,
        pageState: pageState,
      );
    });

    group('call necessary fun', () {
      test("initialWeather()", () async {
        await weatherPageCubit.initialWeather();
        expect(weatherInteractor.callResponseWeather, 1);
        expect(weatherInteractor.callTemps, 1);
        expect(weatherInteractor.callIcons, 1);
        expect(weatherInteractor.callHumidity, 1);
        expect(weatherInteractor.callBaseIcon, 1);
        expect(weatherInteractor.callWind, 1);
        expect(weatherInteractor.callCity, 1);
        expect(pageState.callEmit, 1);
      });    
      
      test("constrains fun return pageState", () async {
         final state = weatherPageCubit.weatherState();
         expect(state, isA<WetherPageState>());
      });
    });
  });
}
