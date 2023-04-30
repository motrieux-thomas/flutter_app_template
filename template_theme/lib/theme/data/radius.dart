import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RadiusThemeData extends Equatable {
  const RadiusThemeData({
    required this.xSmall,
    required this.small,
    required this.regular,
    required this.large,
  });

  factory RadiusThemeData.main() {
    return const RadiusThemeData(
      xSmall: Radius.circular(2),
      small: Radius.circular(4),
      regular: Radius.circular(8),
      large: Radius.circular(16),
    );
  }

  /// xSmall border radius
  /// main: 'circular, radius 2'
  final Radius xSmall;

  /// small border radius
  /// main: 'circular, radius 4'
  final Radius small;

  /// regular border radius
  /// main: 'circular, radius 8'
  final Radius regular;

  /// large border radius
  /// main: 'circular, radius 16'
  final Radius large;

  @override
  List<Object?> get props => [xSmall, small, regular, large];
}

/// Flutter 3 ThemeExtension system.
class RadiusThemeDataExtension
    extends ThemeExtension<RadiusThemeDataExtension> {
  const RadiusThemeDataExtension({
    required this.radius,
  });

  final RadiusThemeData radius;

  // coverage:ignore-start
  @override
  RadiusThemeDataExtension copyWith({RadiusThemeData? radius}) {
    return RadiusThemeDataExtension(
      radius: radius ?? this.radius,
    );
  }

  @override
  RadiusThemeDataExtension lerp(
    ThemeExtension<RadiusThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
  // coverage:ignore-end
}
