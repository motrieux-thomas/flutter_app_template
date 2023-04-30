import 'package:flutter/material.dart';
import 'package:template_theme/theme/data/theme_data.dart';

extension EdgeInsetsX on EdgeInsets {
  EdgeInsets get verticalOnly => copyWith(left: 0, right: 0);
  EdgeInsets get horizontalOnly => copyWith(top: 0, bottom: 0);
  EdgeInsets get leftOnly => copyWith(right: 0, top: 0, bottom: 0);
  EdgeInsets get topOnly => copyWith(left: 0, right: 0, bottom: 0);
  EdgeInsets get bottomOnly => copyWith(left: 0, right: 0, top: 0);
  EdgeInsets get rightOnly => copyWith(top: 0, left: 0, bottom: 0);
}

extension ColorToHex on Color {
  String toHex() => '#${value.toRadixString(16).substring(2)}';
}

extension ThemeModeX on ThemeMode {
  ThemeData get themeData {
    switch (this) {
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.system:
        final brightness = WidgetsBinding.instance.window.platformBrightness;
        return brightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }
}
