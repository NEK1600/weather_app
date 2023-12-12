import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CacheService {
  String cache(String key);
  Future save(String key, String data);
}

class CacheServiceBase implements CacheService {
  final SharedPreferences cacheController;
  CacheServiceBase({required this.cacheController});
  @override
  String cache(String key) {
    return cacheController.getString(key) ?? "";
  }

  @override
  Future save(String key, String data) async {
    await cacheController.setString(key, data);
  }
}
