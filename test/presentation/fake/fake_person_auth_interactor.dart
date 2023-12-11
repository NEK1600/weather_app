import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/person_auth_interactor.dart';
import 'package:weather_app/domain/person_auth.dart';

import 'fake_auth_person.dart';

class FakeAuthPersonInteractor implements PersonAuthInteractor {
  bool serverError = false;
  bool errorValidate = false;
  int callResponse = 0;

  @override
  String validate(String email, String password) {
    if(errorValidate) {
      return "failure";
    } else {
      return "success";
    }
  }

  @override
  Future<Result<PersonAuth, CustomFailure>> response(String email, String password) async {
    callResponse++;
    if(serverError) {
      return Failure(CachePersonFailure(message: "fake message"));
    } else {
      return Success(FakeAuthPerson().authPerson());
    }
  }
}
