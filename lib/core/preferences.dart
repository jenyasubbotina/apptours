import 'package:shared_preferences/shared_preferences.dart';
import 'package:apptours/main.dart';

abstract class Preferences {
  static Preferences get current => di.get<Preferences>();

  factory Preferences() => _PreferencesImpl();

  Future<bool> hasKey(String key);
  Future<bool> removeKey(String key);

  Future<bool?> getBool(String key, {bool? fallback});
  Future<bool> setBool(String key, bool value);

  Future<String?> getString(String key, {String? fallback});
  Future<bool> setString(String key, String value);

  Future<int?> getInt(String key, {int? fallback});
  Future<bool> setInt(String key, int value);

  Future<T> getFromString<T>(String key, T Function(String? value) fromString);
  Future<bool> setToString<T>(String key, String Function() toString);
}

class _PreferencesImpl implements Preferences {
  @override
  Future<bool> hasKey(String key) => SharedPreferences.getInstance().then((sp) => sp.containsKey(key));

  @override
  Future<bool> removeKey(String key) => SharedPreferences.getInstance().then((sp) => sp.remove(key));

  @override
  Future<bool?> getBool(String key, {bool? fallback}) =>
      SharedPreferences.getInstance().then((sp) => sp.getBool(key) ?? fallback);

  @override
  Future<bool> setBool(String key, bool value) =>
      SharedPreferences.getInstance().then((sp) => sp.setBool(key, value));

  @override
  Future<int?> getInt(String key, {int? fallback}) =>
      SharedPreferences.getInstance().then((sp) => sp.getInt(key) ?? fallback);

  @override
  Future<bool> setInt(String key, int value) =>
      SharedPreferences.getInstance().then((sp) => sp.setInt(key, value));

  @override
  Future<String?> getString(String key, {String? fallback}) =>
      SharedPreferences.getInstance().then((sp) => sp.getString(key) ?? fallback);

  @override
  Future<bool> setString(String key, String value) =>
      SharedPreferences.getInstance().then((sp) => sp.setString(key, value));

  @override
  Future<T> getFromString<T>(String key, T Function(String? value) create) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    return create(value);
  }

  @override
  Future<bool> setToString<T>(String key, String Function() toString) async {
    final prefs = await SharedPreferences.getInstance();
    final value = toString();
    return prefs.setString(key, value);
  }
}
