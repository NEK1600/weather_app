import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/person_auth.dart';
import 'package:weather_app/domain/repositories/cache_repository.dart';

import '../repositories/person_auth_repository.dart';

abstract interface class PersonAuthInteractor {
  String validate(String email, String password);
  Future<Result<PersonAuth, CustomFailure>> response(String email, String password);
}

class PersonAuthInteractorBase implements PersonAuthInteractor {
  final PersonAuthRepository authRepository;
  final CacheRepository<PersonAuth> personCacheRepository;
  PersonAuthInteractorBase({
    required this.authRepository,
    required this.personCacheRepository,
  });
  @override
  Future <Result<PersonAuth, CustomFailure>> response(String email, String password) async {
    try {
      final response = await authRepository.response(email, password);
      await personCacheRepository.save(response, "person");
      return Success(response);
    } on ServerError {
      return Failure(ServerFailure(message: "ошибка сети"));
    }
  }

  @override
  String validate(String email, String password) {
    if(email == "" || password == "") {
      return "failure";
    } else {
      return "success";
    }
  }

}
