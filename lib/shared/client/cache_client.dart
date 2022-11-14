abstract class CacheStore {
  Future<void> writeData ({required String key, required List<String> list});
  Future<List<String>?> readData({required String key});
}
