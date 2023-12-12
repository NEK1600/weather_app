import 'package:weather_app/presentation/view_model/state_page/state_mutable_base.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

class UiStateDi {
  DataStateWeatherEmpty stateEmpty = DataStateWeatherEmpty();
  late final StateMutableBase<DataStateBase> stateBase;
  late final WeatherPageStateBase weatherPageStateBase;
  late final StateMutableBase<DataStateBottom> stateBottom;
  late final StateMutableBase<DataStateHour> stateHour;
  late final StateMutableBase<DataStateCity> stateCity;
  init() {
    stateBase = StateMutableBase<DataStateBase>(
        data: stateEmpty.dataStateBase()
    );
    stateBottom = StateMutableBase<DataStateBottom>(
        data: stateEmpty.dataStateBottom()
    );
    stateHour = StateMutableBase<DataStateHour>(
        data: stateEmpty.dataStateHour()
    );
    stateCity = StateMutableBase<DataStateCity>(
        data: stateEmpty.dataStateCity()
    );
    weatherPageStateBase = WeatherPageStateBase(
        stateBottom: stateBottom,
        stateBase: stateBase,
        stateHour: stateHour,
        stateCity: stateCity
    );
  }
}