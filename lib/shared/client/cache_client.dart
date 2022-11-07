abstract class CacheStore {
  Future writeData ({required String key, required list});
  void readData({required String key});
}
