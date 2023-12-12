import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/page_state.dart';
import 'package:weather_app/presentation/view_model/state_page/state_mutable_base.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

void main() {
  group('changeState basePageState', () {
    late WeatherPageStateBase weatherPageState;
    late FakeMutableWeather<DataStateBase> stateBase;
    late FakeMutableWeather<DataStateCity> stateCity;
    late FakeMutableWeather<DataStateBottom> stateBottom;
    late FakeMutableWeather<DataStateHour> stateHour;
    setUp(() {
      stateBase = FakeMutableWeather();
      stateCity = FakeMutableWeather();
      stateBottom = FakeMutableWeather();
      stateHour = FakeMutableWeather();
      weatherPageState = WeatherPageStateBase(
        stateCity: stateCity,
        stateBase: stateBase,
        stateHour: stateHour,
        stateBottom: stateBottom,
      );
    });

    test("emitCity state", () {
      final emit = weatherPageState.emitCity(DataStateCity(city: "fake city"));
      expect(stateCity.putEmit, isA<DataStateCity>());
    });

    test("emitBase state", () {
      final emit = weatherPageState.emitBase(DataStateBase(
          baseIcon: "baseIcon",
          baseTemp: "20",
          baseWeather: "baseWeather"));
      expect(stateBase.putEmit, isA<DataStateBase>());
    });

    test("emitHour state", () {
      final emit = weatherPageState.emitHour(DataStateHour(
          date: "date",
          icons: ["icons"],
          times: [],
          temps: []));
      expect(stateHour.putEmit, isA<DataStateHour>());
    });

    test("emitBottom state", () {
      final emit = weatherPageState.emitBottom(DataStateBottom(
        humidity: "90",
        humidityCharacter: "humidityCharacter",
        wind: "10",
        windCharacter: "windCharacter",
      ));
      expect(stateBottom.putEmit, isA<DataStateBottom>());
    });
  });

  group("save States", () {
    late StateMutableBase<DataStateBase> stateMutableWeather;
    setUp(() {
      stateMutableWeather = StateMutableBase<DataStateBase>(
        data: DataStateBase(
          baseWeather: "",
          baseTemp: "",
          baseIcon: ""
        )
      );
    });
    test('save and change stateBaseWeather', () {
      stateMutableWeather.emit(DataStateBase(
          baseIcon: "baseIcon",
          baseTemp: "20",
          baseWeather: "cloud"));
      expect(stateMutableWeather.uiData().baseWeather, "cloud");
    });

  });
}

class FakeMutableWeather<T> with ChangeNotifier implements PageState<T> {
  T? putEmit;
  @override
  emit(T uiData) {
    putEmit = uiData;
  }

  @override
  T uiData() {
    return putEmit!;
  }

  @override
  bool emptyState() {
    return false;
  }
}
