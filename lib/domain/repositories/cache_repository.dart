abstract interface class CacheRepository<T> {
  T cache(String key);
  Future save(T data, String key);
}
