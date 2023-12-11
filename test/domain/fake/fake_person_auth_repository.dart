import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/person_auth.dart';
import 'package:weather_app/domain/repositories/person_auth_repository.dart';

import '../../presentation/fake/fake_auth_person.dart';

class FakePersonAuthRepository implements PersonAuthRepository {
  bool throwServerError = false;
  int callResponse = 0;
  @override
  Future<PersonAuth> response(String email, String password) async {
    callResponse++;
    if(throwServerError) {
      throw ServerError();
    }
    return FakeAuthPerson().authPerson();
  }
}