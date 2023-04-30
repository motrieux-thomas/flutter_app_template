import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:template_theme/theme/data/theme_data.dart';

enum AppGapSize {
  tiny,
  small,
  medium,
  big,
  huge,
  expanded,
}

class AppGap extends StatelessWidget {
  /// Tiny Gap
  /// main: `4`
  const AppGap.tiny({super.key}) : size = AppGapSize.tiny;

  /// Small Gap
  /// main: '8'
  const AppGap.small({super.key}) : size = AppGapSize.small;

  /// Medium Gap
  /// main: '16'
  const AppGap.medium({super.key}) : size = AppGapSize.medium;

  /// Big Gap
  /// main: '32'
  const AppGap.big({super.key}) : size = AppGapSize.big;

  /// Huge Gap
  /// main: '48'
  const AppGap.huge({super.key}) : size = AppGapSize.huge;

  /// Expanded Gap
  const AppGap.expanded({super.key}) : size = AppGapSize.expanded;

  final AppGapSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (size) {
      case AppGapSize.tiny:
        return Gap(theme.sizes.xxs);
      case AppGapSize.small:
        return Gap(theme.sizes.xs);
      case AppGapSize.medium:
        return Gap(theme.sizes.s);
      case AppGapSize.big:
        return Gap(theme.sizes.m);
      case AppGapSize.huge:
        return Gap(theme.sizes.l);
      case AppGapSize.expanded:
        return const Spacer();
    }
  }
}
