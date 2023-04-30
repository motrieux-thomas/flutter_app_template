import 'package:flutter/material.dart';

class AppIcon extends Icon {
  const AppIcon(
    IconData icon, {
    Key? key,
    Color? color,
    double? size,
    String? semanticLabel,
    TextDirection? textDirection,
  }) : super(
          icon,
          key: key,
          color: color,
          size: size,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );

  /// Icon size `16`
  const AppIcon.small(
    IconData icon, {
    Key? key,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) : super(
          icon,
          key: key,
          color: color,
          size: 16,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );

  /// Icon size `24`
  const AppIcon.regular(
    IconData icon, {
    Key? key,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) : super(
          icon,
          key: key,
          color: color,
          size: 24,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );

  /// Icon size `32`
  const AppIcon.big(
    IconData icon, {
    Key? key,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) : super(
          icon,
          key: key,
          color: color,
          size: 32,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );
}
