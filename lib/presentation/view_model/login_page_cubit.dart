import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/person_auth_interactor.dart';
import 'package:weather_app/presentation/navigation/navigation.dart';

class LoginPageCubit extends Cubit<Widget> {
  final PersonAuthInteractor personAuthInteractor;
  final Navigation navigation;
  LoginPageCubit({
    required this.personAuthInteractor,
    required this.navigation,
  }) : super(Container());

  Future<void> login(String email, String password) async {
    final validate = personAuthInteractor.validate(email, password);
    if(validate == "success") {
      navigation.showProgressDialog();
      final response = await personAuthInteractor.response(email, password);
      final result = switch (response) {
        Success(value:  final r) => navigation.navigate("weatherPage"),
        Failure(value: final e) => _navigateDialog()
      };
    } else {
      navigation.showBaseDialog("заполните все поля");
    }
  }

  _navigateDialog() {
    navigation.pop();
    navigation.showBaseDialog("ошибка регистрации");
  }
}
