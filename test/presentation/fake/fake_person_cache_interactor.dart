import 'package:weather_app/core/exception_handle.dart';

import 'fake_auth_person.dart';

class FakePersonCacheInteractor implements PersonCacheInteractor {
  int callFound = 0;
  bool personFound = true;
  @override
  Result<AuthPerson, CustomFailure> found() {
    callFound++;
    if(personFound) {
      return Success(FakeAuthPerson().authPerson());
    } else {
      return Failure(CachePersonFailure(message: "fake message"));
    }
  }
}
