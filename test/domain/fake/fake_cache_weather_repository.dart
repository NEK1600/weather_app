class FakeCacheWeatherRepository implements CacheWeatherRepository<Weather> {
  int callCache = 0;
  int callSave = 0;
  @override
  Weather cache(String key) {
    callCache++;
  }

  @override
  Future save(Weather data) async {
    callSave++;
  }
}