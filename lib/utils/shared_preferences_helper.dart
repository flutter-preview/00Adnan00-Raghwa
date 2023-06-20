import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesHelper {
  static late final SharedPreferences _prefs;

  // This should be called in main function before runApp
  static Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  static String? getString(String key) => _prefs.getString(key);

  static int? getInt(String key) => _prefs.getInt(key);

  static double? getDouble(String key) => _prefs.getDouble(key);

  static bool? getBool(String key) => _prefs.getBool(key);

  static int? getInitialRouteCode() {
    return getInt('initial_route_code');
  }
}
