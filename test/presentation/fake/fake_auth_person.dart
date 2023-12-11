import 'package:weather_app/domain/person_auth.dart';

class FakeAuthPerson {
  PersonAuth authPerson() {
    return PersonAuth(
      email: "fake email",
      password: "fake password",
    );
  }
}