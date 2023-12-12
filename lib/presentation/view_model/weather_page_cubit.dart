

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/location_interactor.dart';
import 'package:weather_app/domain/interactor/weather_interactor.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/weather.dart';
import 'package:weather_app/presentation/navigation/navigation.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

class WeatherPageCubit extends Cubit<Widget> {
  final WeatherInteractor weatherInteractor;
  final LocationInteractor locationInteractor;
  final WeatherPageState pageState;
  final Navigation navigation;
  WeatherPageCubit({
    required this.pageState,
    required this.locationInteractor,
    required this.weatherInteractor,
    required this.navigation,
  }) : super(Container());

  Future<void> initialWeather() async {
    final location = await locationInteractor.location();
    final locationResult = switch (location) {
      Success(value:  final r) => await _initial(r),
      Failure(value: final e) => navigation.showBaseDialog("включите геолокацию")
    };
  }

  _initial(LocationBase location) async {
    Weather response = await weatherInteractor.responseWeather(location);
    final humidity = weatherInteractor.humidity(response);
    final baseIcon = weatherInteractor.baseIcon(response);
    final iconsMin = weatherInteractor.iconsMin(response);
    final wind = weatherInteractor.wind(response);
    await Future.delayed(const Duration(seconds: 1));
    pageState.emitCity(DataStateCity(city: response.timezone));
    await Future.delayed(const Duration(seconds: 1));
    pageState.emitBase(DataStateBase(
        baseIcon: baseIcon,
        baseTemp: response.temps()[0],
        baseWeather: response.hourly[0].main));
    await Future.delayed(const Duration(seconds: 1));
    pageState.emitHour(DataStateHour(
        date: response.day(),
        icons: iconsMin,
        times: response.times(),
        temps: response.temps()));
    await Future.delayed(const Duration(seconds: 1));
    pageState.emitBottom(DataStateBottom(
        wind: wind,
        windCharacter: response.hourly[0].windCharacter(),
        humidity: humidity,
        humidityCharacter: response.hourly[0].humidityCharacter())
    );
  }

  WeatherPageState weatherState() {
    return pageState;
  }
}
