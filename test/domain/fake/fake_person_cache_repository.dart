import 'package:weather_app/core/exception_throw.dart';

import '../../presentation/fake/fake_auth_person.dart';

class FakePersonCacheRepository implements PersonCacheRepository<PersonAuth> {
  int callSave = 0;
  int callCache = 0;
  bool throwCacheError = false;
  @override
  PersonAuth cache() {
    callCache++;
    if(throwCacheError) {
      throw CacheError();
    }
    return FakeAuthPerson().authPerson();
  }

  @override
  Future save(String key) async {
    callSave++;
  }
}