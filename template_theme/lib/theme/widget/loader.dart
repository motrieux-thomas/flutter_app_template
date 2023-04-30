import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:template_theme/theme/data/theme_data.dart';

enum AppLoaderSize {
  small,
  regular,
  big,
}

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.color}) : size = AppLoaderSize.regular;

  const AppLoader.small({super.key, this.color}) : size = AppLoaderSize.small;

  const AppLoader.regular({
    super.key,
    this.color,
  }) : size = AppLoaderSize.regular;

  const AppLoader.big({super.key, this.color}) : size = AppLoaderSize.big;

  final AppLoaderSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = this.color ?? Theme.of(context).colors.brandPrimary;
    final dimension = () {
      switch (size) {
        case AppLoaderSize.big:
          return theme.sizes.l;
        case AppLoaderSize.regular:
          return theme.sizes.m;
        case AppLoaderSize.small:
          return theme.sizes.s;
      }
    }();

    return SizedBox(
      height: dimension,
      width: 2 * dimension,
      child: SpinKitThreeBounce(
        color: color,
        size: dimension,
      ),
    );
  }
}
