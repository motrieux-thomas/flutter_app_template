import 'package:hive_flutter/hive_flutter.dart';

class PreferencesApi {
  static const _themeKey = "ActiveTheme";

  final Box<String> box;
  PreferencesApi._(this.box);

  static Future<PreferencesApi> getApi({required HiveInterface hive}) async {
    final boxName = 'preferences';
    final box = await hive.openBox<String>(boxName);
    return PreferencesApi._(box);
  }

  String? getActiveTheme() {
    return box.get(_themeKey);
  }

  Future<void> putActiveTheme(String theme) async {
    return box.put(_themeKey, theme);
  }
}
