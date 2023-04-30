import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class InsetsThemeData extends Equatable {
  const InsetsThemeData({
    required this.xxs,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
  });

  factory InsetsThemeData.phone() {
    return const InsetsThemeData(
      xxs: EdgeInsets.all(2),
      xs: EdgeInsets.all(4),
      s: EdgeInsets.all(8),
      m: EdgeInsets.all(16),
      l: EdgeInsets.all(24),
      xl: EdgeInsets.all(32),
      xxl: EdgeInsets.all(64),
    );
  }

  /// XXS size - main: `2`
  final EdgeInsets xxs;

  /// XS size - main: `4`
  final EdgeInsets xs;

  /// S size - main: `8`
  final EdgeInsets s;

  /// M size - main: `16`
  final EdgeInsets m;

  /// L size - main: `24`
  final EdgeInsets l;

  /// XL size - main: `32`
  final EdgeInsets xl;

  /// XXL size - main: `64`
  final EdgeInsets xxl;

  @override
  List<EdgeInsets> get props => [xs, s, m, l, xl, xxl];
}

/// Flutter 3 ThemeExtension system.
class InsetsThemeDataExtension
    extends ThemeExtension<InsetsThemeDataExtension> {
  const InsetsThemeDataExtension({
    required this.insets,
  });

  final InsetsThemeData insets;

  // coverage:ignore-start
  @override
  InsetsThemeDataExtension copyWith({InsetsThemeData? insets}) {
    return InsetsThemeDataExtension(insets: insets ?? this.insets);
  }

  @override
  InsetsThemeDataExtension lerp(
    ThemeExtension<InsetsThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
  // coverage:ignore-end
}
