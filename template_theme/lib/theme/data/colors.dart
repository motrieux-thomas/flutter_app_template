//coverage:ignore-file
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorsThemeData extends Equatable {
  static byThemeMode(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) return ColorsThemeData.light();
    return ColorsThemeData.dark();
  }

  final ThemeMode themeMode;

  const ColorsThemeData({
    required this.themeMode,
    // Backgrounds
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundInverted,
    // Texts
    required this.textPrimary,
    required this.textSecondary,
    required this.textInverted,
    required this.textPlaceholder,
    required this.textLink,
    // Borders
    required this.borderPrimary,
    required this.borderSecondary,
    // Brand colors
    required this.brandPrimary,
    required this.green,
    required this.greenDullest,
    required this.red,
    required this.redDullest,
    required this.black,
    required this.white,
    // Shimmer
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  factory ColorsThemeData.light() {
    return ColorsThemeData(
      themeMode: ThemeMode.light,
      // Background colors
      backgroundPrimary: Colors.white,
      backgroundSecondary: Colors.grey[100]!,
      backgroundInverted: Colors.grey[850]!,
      // Texts
      textPrimary: Colors.black87,
      textSecondary: Colors.black54,
      textPlaceholder: Colors.black26,
      textInverted: Colors.white,
      textLink: Colors.blue[400]!,
      // Borders
      borderPrimary: Colors.black87,
      borderSecondary: Colors.black54,
      // Colors
      brandPrimary: Colors.blue,
      green: Colors.green[500]!,
      greenDullest: Colors.green[100]!,
      red: Colors.red[500]!,
      redDullest: Colors.red[100]!,
      black: Colors.black87,
      white: Colors.white,
      // Shimmer
      shimmerBase: Colors.grey[300]!,
      shimmerHighlight: Colors.grey[100]!,
    );
  }

  factory ColorsThemeData.dark() {
    return ColorsThemeData(
      themeMode: ThemeMode.dark,
      // Backgrounds
      backgroundPrimary: Colors.grey[850]!,
      backgroundSecondary: Colors.grey[800]!,
      backgroundInverted: Colors.white,
      // Texts
      textPrimary: Colors.white,
      textSecondary: Colors.white60,
      textPlaceholder: Colors.white24,
      textInverted: Colors.black87,
      textLink: Colors.indigo[700]!,
      // Borders
      borderPrimary: Colors.white,
      borderSecondary: Colors.white60,
      // Colors
      brandPrimary: Colors.indigo,
      green: Colors.green[500]!,
      greenDullest: Colors.green[100]!,
      red: Colors.red[500]!,
      redDullest: Colors.red[100]!,
      black: Colors.black87,
      white: Colors.white,
      // Shimmer
      shimmerBase: Colors.grey[300]!,
      shimmerHighlight: Colors.grey[100]!,
    );
  }

  /// Backgrounds
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundInverted;

  /// Texts
  final Color textPrimary;
  final Color textSecondary;
  final Color textPlaceholder;
  final Color textInverted;
  final Color textLink;

  // Borders
  final Color borderPrimary;
  final Color borderSecondary;

  /// Colors
  final Color brandPrimary;
  final Color green;
  final Color greenDullest;
  final Color red;
  final Color redDullest;
  final Color black;
  final Color white;

  // Shimmers
  final Color shimmerBase;
  final Color shimmerHighlight;

  @override
  List<Object?> get props {
    return [
      // Backgrounds
      backgroundPrimary,
      backgroundSecondary,
      backgroundInverted,
      // Texts
      textPrimary,
      textSecondary,
      textPlaceholder,
      textInverted,
      textLink,
      // Borders
      borderPrimary,
      borderSecondary,
      // Brand colors
      brandPrimary,
      green,
      greenDullest,
      red,
      redDullest,
      black,
      white,
      // Shimmer
      shimmerBase,
      shimmerHighlight,
    ];
  }
}

class ColorsThemeDataExtension
    extends ThemeExtension<ColorsThemeDataExtension> {
  const ColorsThemeDataExtension({required this.colors});

  final ColorsThemeData colors;

  @override
  ColorsThemeDataExtension copyWith({ColorsThemeData? colors}) {
    return ColorsThemeDataExtension(colors: colors ?? this.colors);
  }

  @override
  ColorsThemeDataExtension lerp(
    ThemeExtension<ColorsThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
}
