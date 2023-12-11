import 'package:weather_app/domain/person_auth.dart';

abstract interface class PersonAuthRepository {
  Future<PersonAuth> response(String email, String password);
}