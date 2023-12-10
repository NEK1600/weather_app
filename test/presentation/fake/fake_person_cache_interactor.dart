import 'package:weather_app/core/exception_handle.dart';

import 'fake_auth_person.dart';

class FakePersonCacheInteractor implements PersonCacheInteractor {
  int callCache = 0;
  int callSaveCache = 0;
  bool personFound = true;
  @override
  Result<AuthPerson, CustomFailure> cache() {
    callCache++;
    if(personFound) {
      return Success(FakeAuthPerson().authPerson());
    } else {
      return Failure(CachePersonFailure(message: "fake message"));
    }
  }

  @override
  Future saveCache() async {
    callSaveCache++;
  }
}
