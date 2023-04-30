import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DurationsThemeData extends Equatable {
  const DurationsThemeData({
    required this.fast,
    required this.regular,
    required this.long,
  });

  /// Phone DurationsThemeData
  factory DurationsThemeData.main() {
    return const DurationsThemeData(
      fast: Duration(milliseconds: 100),
      regular: Duration(milliseconds: 250),
      long: Duration(milliseconds: 500),
    );
  }

  /// Fast duration - main: '100 ms'
  final Duration fast;

  /// Fast duration - main: '250 ms'
  final Duration regular;

  /// Fast duration - main: '500 ms'
  final Duration long;

  @override
  List<Object?> get props => [fast, regular, long];
}

/// Flutter 3 ThemeExtension system.
class DurationsThemeDataExtension
    extends ThemeExtension<DurationsThemeDataExtension> {
  const DurationsThemeDataExtension({
    required this.durations,
  });

  final DurationsThemeData durations;

  // coverage:ignore-start
  @override
  DurationsThemeDataExtension copyWith({
    DurationsThemeData? durations,
  }) {
    return DurationsThemeDataExtension(durations: durations ?? this.durations);
  }

  @override
  DurationsThemeDataExtension lerp(
    ThemeExtension<DurationsThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
  // coverage:ignore-end
}
