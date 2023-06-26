import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  SharedPreferences? _preferences;

  // if _instance is null, return SharedPreferencesManager._()
  factory SharedPreferencesManager() => _instance ??= SharedPreferencesManager._();
  SharedPreferencesManager._();

  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Future<void> saveData(String key, String value) async {
  //   await _preferences?.setString(key, value);
  // }

  Future<void> saveListData(String key, List<String> value) async {
    await _preferences?.setStringList(key, value);
  }

  // Future<String> loadData(String key) async {
  //   return _preferences?.getString(key) ?? '';
  // }

  Future<List<String>> loadListData(String key) async {
    return _preferences?.getStringList(key) ?? [];
  }
}