import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SizesThemeData extends Equatable {
  const SizesThemeData({
    required this.xxs,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });

  factory SizesThemeData.phone() {
    return const SizesThemeData(
      xxs: 4,
      xs: 8,
      s: 16,
      m: 32,
      l: 48,
      xl: 64,
    );
  }

  /// XXS size - main: `4`
  final double xxs;

  /// XS size - main: `8`
  final double xs;

  /// S size - main: `16`
  final double s;

  /// M size - main: `32`
  final double m;

  /// L size - main: `48`
  final double l;

  /// XL size - main: `64`
  final double xl;

  @override
  List<Object?> get props => [xxs, xs, s, m, l, xl];
}

/// Flutter 3 ThemeExtension system.
class SizesThemeDataExtension extends ThemeExtension<SizesThemeDataExtension> {
  const SizesThemeDataExtension({required this.sizes});

  final SizesThemeData sizes;

  // coverage:ignore-start
  @override
  SizesThemeDataExtension copyWith({SizesThemeData? sizes}) {
    return SizesThemeDataExtension(sizes: sizes ?? this.sizes);
  }

  @override
  SizesThemeDataExtension lerp(
    ThemeExtension<SizesThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
  // coverage:ignore-end
}
