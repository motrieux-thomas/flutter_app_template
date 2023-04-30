import 'package:flutter/material.dart';
import 'package:local_repo/local_repo.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  SettingsService(this._preferencesApi);

  final PreferencesApi _preferencesApi;

  /// Loads the User's preferred ThemeMode from local or remote storage.
  get themeMode {
    final String? theme = _preferencesApi.getActiveTheme();
    ThemeMode? themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == theme,
      orElse: () => ThemeMode.system,
    );
    return themeMode;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    await _preferencesApi.putActiveTheme(theme.name);
  }
}
