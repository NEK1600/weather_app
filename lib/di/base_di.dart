import 'package:go_router/go_router.dart';
import 'package:weather_app/di/navigation_di.dart';
import 'package:weather_app/di/package_di.dart';
import 'package:weather_app/di/view_model_di.dart';
import 'package:weather_app/presentation/view_model/initial_cubit.dart';
import 'package:weather_app/presentation/view_model/login_page_cubit.dart';
import 'package:weather_app/presentation/view_model/weather_page_cubit.dart';

class BaseDi {
  final PackageDi _packageDi = PackageDi();
  late final NavigationDi _navigationDi = NavigationDi(packageDi: _packageDi);
  late final ViewModelDi _viewModelDi = ViewModelDi(packageDi: _packageDi, navigationDi: _navigationDi);

  Future<void> init() async {
    await _packageDi.init();
    await _navigationDi.init();
    await _viewModelDi.init();
  }

  InitialCubit initialCubit() {
    return _viewModelDi.initialCubitBase();
  }

  LoginPageCubit loginCubit() {
    return _viewModelDi.loginCubitBase();
  }

  WeatherPageCubit weatherCubit() {
    return _viewModelDi.weatherCubit;
  }

  GoRouter router() {
    return _packageDi.router;
  }
}
