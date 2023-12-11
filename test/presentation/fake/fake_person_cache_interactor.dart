import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/person_cache_interactor.dart';
import 'package:weather_app/domain/person_auth.dart';

import 'fake_auth_person.dart';

class FakePersonCacheInteractor implements PersonCacheInteractor {
  int callFound = 0;
  bool personFound = true;
  @override
  Result<PersonAuth, CustomFailure> found() {
    callFound++;
    if(personFound) {
      return Success(FakeAuthPerson().authPerson());
    } else {
      return Failure(CachePersonFailure(message: "fake message"));
    }
  }
}
