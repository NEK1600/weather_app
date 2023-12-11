import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/page_state.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

void main() {
  group('save state', () {
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

    test("initial state", () {
      final initial = weatherPageState.uiData();
      expect(initial, isA<DataStateEmpty>());
    });

    test("emitCity state", () {
      final emit = weatherPageState.emitCity(DataStateCity(city: "fake city"));
      expect(emit.city, "fake city");
    });

    test("emitBase state", () {
      final emit = weatherPageState.emitBase(DataStateBase(
          baseIcon: "baseIcon",
          baseTemp: 20,
          baseWeather: "baseWeather"));
      expect(emit.baseIcon, "baseIcon");
    });

    test("emitHour state", () {
      final emit = weatherPageState.emitHour(DataStateHour(
          date: "date",
          icons: ["icons"],
          times: [],
          temps: []));
      expect(emit.icons, ["icons"]);
    });

    test("emitBottom state", () {
      final emit = weatherPageState.emitBottom(DataStateBottom(
        humidity: 90,
        humidityCharacter: "humidityCharacter",
        wind: 10,
        windCharacter: "windCharacter",
      ));
      expect(emit.windCharacter, "windCharacter");
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
