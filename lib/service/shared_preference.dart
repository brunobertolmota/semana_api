import 'package:semana_api/shared/client/cache_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceTestImpl implements CacheStore {
  // final SharedPreferences prefs;

  // SharedPreferenceTestImpl({required this.prefs});
  
  @override
  Future<void> writeData({required String key, required List<String> list}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, list);
  }

  @override
  Future<List<String>?> readData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }
}
