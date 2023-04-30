import 'package:flutter/material.dart';
import 'package:template_theme/theme/data/theme_data.dart';

class AppLine extends StatelessWidget {
  final Color? color;
  final double breadth;
  final double length;
  final bool isHorizontal;

  const AppLine({
    Key? key,
    this.color,
    this.breadth = 1,
    this.length = double.infinity,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).colors.backgroundPrimary,
      height: isHorizontal ? breadth : length,
      width: isHorizontal ? length : breadth,
    );
  }
}
