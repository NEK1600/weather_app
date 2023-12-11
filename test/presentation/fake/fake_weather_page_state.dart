import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/page_state.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

class FakeWeatherPageState implements WeatherPageState {
  int callEmitCity = 0;
  int callEmitBase = 0;
  int callEmitHour = 0;
  int callEmitBottom = 0;
  @override
  emitCity(DataStateCity uiData) {

  }

  @override
  emitBase(DataStateBase uiData) {

  }

  @override
  emitHour(DataStateHour uiData) {

  }

  @override
  emitBottom(DataStateBottom uiData) {

  }
}
