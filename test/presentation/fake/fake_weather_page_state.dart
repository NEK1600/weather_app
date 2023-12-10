import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/page_state.dart';

class FakeWeatherPageState with ChangeNotifier implements PageState<WeatherUiData> {
  int callEmit = 0;
  int callUiData = 0;
  @override
  emit(WeatherUiData uiData) {
    callEmit++;
  }

  @override
  WeatherUiData uiData() {
    callUiData++;
  }
}
