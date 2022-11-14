abstract class CacheStore {
  Future<void> writeData ({required String key, required List<String> list});
  Future<void> readData({required String key});
}
