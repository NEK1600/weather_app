import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/person_cache_interactor.dart';
import 'package:weather_app/presentation/navigation/navigation.dart';

class InitialCubit extends Cubit<Widget> {
  final PersonCacheInteractor personCache;
  final Navigation navigation;
  InitialCubit({
    required this.personCache,
    required this.navigation,
  }) : super(Container());

  Future<void> initialApp() async {
    print("test1 initialApp()");
    final found = personCache.found();
    final result = switch (found) {
      Success(value:  final r) => navigation.navigate("weatherPage"),
      Failure(value: final e) => navigation.navigate("loginPage")
    };
  }

}
