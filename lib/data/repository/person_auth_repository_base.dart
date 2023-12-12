import 'package:weather_app/data/firebase_service.dart';
import 'package:weather_app/domain/person_auth.dart';
import 'package:weather_app/domain/repositories/person_auth_repository.dart';

class PersonAuthRepositoryBase implements PersonAuthRepository {
  final FirebaseService firebaseService;
  PersonAuthRepositoryBase({required this.firebaseService});
  @override
  Future<PersonAuth> response(String email, String password) async {
    await firebaseService.response(email, password);
    return PersonAuth(password: password, email: email);
  }
}
