import 'dart:convert';

import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/data/cache_service.dart';
import 'package:weather_app/domain/person_auth.dart';
import 'package:weather_app/domain/repositories/cache_repository.dart';

class CachePersonBase implements CacheRepository<PersonAuth> {
  final CacheService cacheService;
  CachePersonBase({required this.cacheService});
  @override
  PersonAuth cache(String key) {
    final dataCache = cacheService.cache(key);
    if(dataCache.isEmpty) {
      throw CacheError();
    } else {
      Map<String, dynamic> map = jsonDecode(dataCache);
      PersonAuth data = PersonAuth(
        email: map["email"],
        password: map["password"],
      );
      return data;
    }
  }

  @override
  Future save(PersonAuth data, String key) async {
    Map<String, dynamic> map = {
      "email": data.email,
      "password": data.password,
    };
    await cacheService.save(key, jsonEncode(map));
  }
}
