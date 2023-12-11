import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';
import 'package:weather_app/presentation/view_model/weather_page_cubit.dart';

import '../fake/fake_location_interactor.dart';
import '../fake/fake_navigation.dart';
import '../fake/fake_weather_interactor.dart';
import '../fake/fake_weather_page_state.dart';

void main() {
  group("all", () {
    late WeatherPageCubit weatherPageCubit;
    late FakeWeatherInteractor weatherInteractor;
    late FakeLocationInteractor locationInteractor;
    late FakeWeatherPageState pageState;
    late FakeNavigation navigation;
    setUp(() {
      weatherInteractor = FakeWeatherInteractor();
      locationInteractor = FakeLocationInteractor();
      pageState = FakeWeatherPageState();
      navigation = FakeNavigation();
      weatherPageCubit = WeatherPageCubit(
        weatherInteractor: weatherInteractor,
        pageState: pageState,
        locationInteractor: locationInteractor,
        navigation: navigation,
      );
    });

    group('call necessary fun', () {
      test("WeatherPageCubit()", () async {
        await weatherPageCubit.initialWeather();
        expect(locationInteractor.callLocation, 1);
        expect(weatherInteractor.callResponseWeather, 1);
        expect(weatherInteractor.callHumidity, 1);
        expect(weatherInteractor.callBaseIcon, 1);
        expect(weatherInteractor.callWind, 1);
        expect(pageState.callEmitCity, 1);
        expect(pageState.callEmitBase, 1);
        expect(pageState.callEmitHour, 1);
        expect(pageState.callEmitBottom, 1);
      });
      
      test("constrains fun return pageState", () async {
         final state = weatherPageCubit.weatherState();
         expect(state, isA<WeatherPageState>());
      });
    });
  });
}
