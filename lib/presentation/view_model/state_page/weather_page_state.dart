import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/page_state.dart';

abstract interface class WeatherPageState {
  emitCity(DataStateCity uiData);
  emitBase(DataStateBase uiData);
  emitHour(DataStateHour uiData);
  emitBottom(DataStateBottom uiData);
}

class WeatherPageStateBase implements WeatherPageState {
  final PageState<DataStateCity> stateCity;
  final PageState<DataStateHour> stateHour;
  final PageState<DataStateBase> stateBase;
  final PageState<DataStateBottom> stateBottom;
  WeatherPageStateBase({
    required this.stateBottom,
    required this.stateBase,
    required this.stateHour,
    required this.stateCity,
  });
  @override
  emitBase(DataStateBase uiData) {
    stateBase.emit(uiData);
  }

  @override
  emitBottom(DataStateBottom uiData) {
    stateBottom.emit(uiData);
  }

  @override
  emitCity(DataStateCity uiData) {
    stateCity.emit(uiData);
  }

  @override
  emitHour(DataStateHour uiData) {
    stateHour.emit(uiData);
  }
}

class StateCityWeather with ChangeNotifier implements PageState<DataStateCity> {
  late DataStateCity _data;
  @override
  emit(DataStateCity uiData) {
    _data = uiData;
    notifyListeners();
  }

  @override
  DataStateCity uiData() {
    return _data;
  }

}

class StateBaseWeather with ChangeNotifier implements PageState<DataStateBase> {
  late DataStateBase _data;
  @override
  emit(DataStateBase uiData) {
    _data = uiData;
    notifyListeners();
  }

  @override
  DataStateBase uiData() {
    return _data;
  }

}

class StateHourWeather with ChangeNotifier implements PageState<DataStateHour> {
  late DataStateHour _data;
  @override
  emit(DataStateHour uiData) {
    _data = uiData;
    notifyListeners();
  }

  @override
  DataStateHour uiData() {
    return _data;
  }

}

class StateBottomWeather with ChangeNotifier implements PageState<DataStateBottom> {
  late DataStateBottom _data;
  @override
  emit(DataStateBottom uiData) {
    _data = uiData;
    notifyListeners();
  }

  @override
  DataStateBottom uiData() {
    return _data;
  }

}

class DataStateCity {
  final String city;
  DataStateCity({required this.city});
}

class DataStateBase {
  final String baseIcon;
  final String baseTemp;
  final String baseWeather;
  DataStateBase({
    required this.baseIcon,
    required this.baseTemp,
    required this.baseWeather,
  });
}

class DataStateHour {
  final String date;
  final List<String> icons;
  final List<String> times;
  final List<String> temps;
  DataStateHour({
    required this.date,
    required this.icons,
    required this.times,
    required this.temps,
  });
}

class DataStateBottom {
  final String wind;
  final String windCharacter;
  final String humidity;
  final String humidityCharacter;
  DataStateBottom({
    required this.wind,
    required this.windCharacter,
    required this.humidity,
    required this.humidityCharacter,
  });
}