import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/page_state.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

void main() {
  group('changeState basePageState', () {
    late WeatherPageStateBase weatherPageState;
    late FakeStateCityWeather stateCity;
    late FakeStateBaseWeather stateBase;
    late FakeStateHourWeather stateHour;
    late FakeStateBottomWeather stateBottom;
    setUp(() {
      stateCity = FakeStateCityWeather();
      stateBase = FakeStateBaseWeather();
      stateHour = FakeStateHourWeather();
      stateBottom = FakeStateBottomWeather();
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
          baseTemp: 20,
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
        humidity: 90,
        humidityCharacter: "humidityCharacter",
        wind: 10,
        windCharacter: "windCharacter",
      ));
      expect(stateBottom.putEmit, isA<DataStateBottom>());
    });
  });

  group("save States", () {
    late StateCityWeather stateCityWeather;
    late StateBaseWeather stateBaseWeather;
    late StateHourWeather stateHourWeather;
    late StateBottomWeather stateBottomWeather;
    setUp(() {
      stateCityWeather = StateCityWeather();
      stateBaseWeather = StateBaseWeather();
      stateHourWeather = StateHourWeather();
      stateBottomWeather = StateBottomWeather();
    });

    test('save and change stateCityWeather', () {
      stateCityWeather.emit(DataStateCity(city: "fake city"));
      expect(stateCityWeather.uiData().city, "fake city");
    });
    test('save and change stateBaseWeather', () {
      stateBaseWeather.emit(DataStateBase(
          baseIcon: "baseIcon",
          baseTemp: 20,
          baseWeather: "cloud"));
      expect(stateBaseWeather.uiData().baseWeather, "cloud");
    });
    test('save and change stateHourWeather', () {
      stateHourWeather.emit(DataStateHour(
          date: "date",
          icons: ["icons"],
          times: [],
          temps: []
      ));
      expect(stateHourWeather.uiData().icons[0], "icons");
    });
    test('save and change stateBottomWeather', () {
      stateBottomWeather.emit(DataStateBottom(
          wind: 20,
          windCharacter: "windCharacter",
          humidity: 90,
          humidityCharacter: "humidityCharacter")
      );
      expect(stateBottomWeather.uiData().windCharacter, "windCharacter");
    });

  });
}

class FakeStateCityWeather with ChangeNotifier implements PageState<DataStateCity> {
  late DataStateCity putEmit;
  @override
  emit(DataStateCity uiData) {
    putEmit = uiData;
  }

  @override
  DataStateCity uiData() {
    return putEmit;
  }
}

class FakeStateBaseWeather with ChangeNotifier implements PageState<DataStateBase> {
  late DataStateBase putEmit;
  @override
  emit(DataStateBase uiData) {
    putEmit = uiData;
  }

  @override
  DataStateBase uiData() {
    return putEmit;
  }
}

class FakeStateHourWeather with ChangeNotifier implements PageState<DataStateHour> {
  late DataStateHour putEmit;
  @override
  emit(DataStateHour uiData) {
    putEmit = uiData;
  }

  @override
  DataStateHour uiData() {
    return putEmit;
  }
}

class FakeStateBottomWeather with ChangeNotifier implements PageState<DataStateBottom> {
  late DataStateBottom putEmit;
  @override
  emit(DataStateBottom uiData) {
    putEmit = uiData;
  }

  @override
  DataStateBottom uiData() {
    return putEmit;
  }

}
