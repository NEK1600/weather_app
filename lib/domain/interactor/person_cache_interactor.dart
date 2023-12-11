import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/person_auth.dart';
import 'package:weather_app/domain/repositories/cache_repository.dart';

abstract interface class PersonCacheInteractor {
  @override
  Result<PersonAuth, CustomFailure> found();
}

class PersonCacheInteractorBase implements PersonCacheInteractor {
  final CacheRepository<PersonAuth> personCacheRepository;
  PersonCacheInteractorBase({required this.personCacheRepository});
  @override
  Result<PersonAuth, CustomFailure> found() {
    try {
      final data = personCacheRepository.cache("person");
      return Success(PersonAuth(email:data.email, password: data.password));
    } on CacheError {
      return Failure(CachePersonFailure(message: "пользователь не авторизован"));
    }
  }
}
