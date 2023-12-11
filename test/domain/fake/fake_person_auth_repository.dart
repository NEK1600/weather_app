import 'package:weather_app/core/exception_throw.dart';

import '../../presentation/fake/fake_auth_person.dart';

class FakePersonAuthRepository implements PersonAuthRepository {
  bool throwServerError = true;
  int callResponse = 0;
  @override
  Future<AuthPerson> response(String email, String password) {
    callResponse++;
    if(throwServerError) {
      throw ServerError();
    }
    return FakeAuthPerson().authPerson();
  }
}