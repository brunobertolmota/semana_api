abstract class CacheStore {
  Future wiretData ({required String key, required list});
  void readData({required String key});
}
