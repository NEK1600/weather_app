import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/person_auth.dart';
import 'package:weather_app/domain/repositories/cache_repository.dart';

import '../../presentation/fake/fake_auth_person.dart';

class FakePersonCacheRepository implements CacheRepository<PersonAuth> {
  int callSave = 0;
  int callCache = 0;
  bool throwCacheError = false;
  @override
  PersonAuth cache(String key) {
    callCache++;
    if(throwCacheError) {
      throw CacheError();
    }
    return FakeAuthPerson().authPerson();
  }

  @override
  Future save(PersonAuth data, String key) async {
    callSave++;
  }
}