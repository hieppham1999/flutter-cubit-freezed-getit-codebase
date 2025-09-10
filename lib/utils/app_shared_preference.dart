import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppSharedPreference get prefs => GetIt.I<AppSharedPreference>();

@Singleton(dependsOn: [SharedPreferences])
class AppSharedPreference {

  AppSharedPreference(this.prefs);

  final SharedPreferences prefs;

  /// Get string value
  String? getString(String key) => prefs.getString(key);

  /// Set string value
  Future<bool> setString(String key, String value) => prefs.setString(key, value);

  /// Get bool value
  bool? getBool(String key) => prefs.getBool(key);

  /// Set bool value
  Future<bool> setBool(String key, bool value) => prefs.setBool(key, value);

  /// Remove a key
  Future<bool> remove(String key) => prefs.remove(key);

  /// Clear all
  Future<bool> clear() => prefs.clear();

}