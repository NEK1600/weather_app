import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

class FakeWeatherPageState implements WeatherPageState {
  int callEmitCity = 0;
  int callEmitBase = 0;
  int callEmitHour = 0;
  int callEmitBottom = 0;
  @override
  emitCity(DataStateCity uiData) {
    callEmitCity++;
  }

  @override
  emitBase(DataStateBase uiData) {
    callEmitBase++;
  }

  @override
  emitHour(DataStateHour uiData) {
    callEmitHour++;
  }

  @override
  emitBottom(DataStateBottom uiData) {
    callEmitBottom++;
  }
}
