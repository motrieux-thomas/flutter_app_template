import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

BoxShadow _xLight(Color color) =>
    BoxShadow(color: color.withOpacity(0.06), blurRadius: 8);

BoxShadow _light(Color color) =>
    BoxShadow(color: color.withOpacity(0.06), blurRadius: 16);

BoxShadow _medium(Color color) => BoxShadow(
      color: color.withOpacity(0.15),
      offset: const Offset(0, 10),
      blurRadius: 20,
    );

BoxShadow _strong(Color color) => BoxShadow(
      color: color.withOpacity(0.30),
      offset: const Offset(0, 20),
      blurRadius: 40,
    );

class ShadowsThemeData extends Equatable {
  const ShadowsThemeData({
    required this.xLight,
    required this.light,
    required this.medium,
    required this.strong,
  });

  factory ShadowsThemeData.light() {
    const Color lightShadowColor = Colors.black87;
    return ShadowsThemeData(
      xLight: _xLight(lightShadowColor),
      light: _light(lightShadowColor),
      medium: _medium(lightShadowColor),
      strong: _strong(lightShadowColor),
    );
  }

  factory ShadowsThemeData.dark() {
    const Color darkShadowColor = Colors.black54;

    return ShadowsThemeData(
      xLight: _xLight(darkShadowColor),
      light: _light(darkShadowColor),
      medium: _medium(darkShadowColor),
      strong: _strong(darkShadowColor),
    );
  }

  /// xLight BoxShadow
  final BoxShadow xLight;

  /// Light BoxShadow
  final BoxShadow light;

  /// Medium BoxShadow
  final BoxShadow medium;

  /// Strong BoxShadow
  final BoxShadow strong;

  @override
  List<Object?> get props => [xLight, light, medium, strong];
}

/// Flutter 3 ThemeExtension system.
class ShadowsThemeDataExtension
    extends ThemeExtension<ShadowsThemeDataExtension> {
  const ShadowsThemeDataExtension({
    required this.shadows,
  });

  final ShadowsThemeData shadows;

  // coverage:ignore-start
  @override
  ShadowsThemeDataExtension copyWith({ShadowsThemeData? shadows}) {
    return ShadowsThemeDataExtension(
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  ShadowsThemeDataExtension lerp(
    ThemeExtension<ShadowsThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
  // coverage:ignore-end
}
