import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/core/exception_throw.dart';

abstract interface class FirebaseService {
  Future<dynamic> response(String email, String password);
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseAuth firebaseAuth;
  FirebaseServiceImpl({required this.firebaseAuth});
  @override
  Future<dynamic> response(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw ServerError();
    }
  }
}
