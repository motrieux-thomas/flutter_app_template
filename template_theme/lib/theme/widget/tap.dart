import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_theme/theme/data/theme_data.dart';

class AppTap extends StatelessWidget {
  const AppTap({
    Key? key,
    required this.child,
    required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.radius,
    this.fit,
    this.enableMinSize = true,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;

  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final double? radius;
  final BoxFit? fit;
  final bool enableMinSize;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localFit = fit;
    Widget localChild = child;
    final localBorderRadius =
        borderRadius ?? BorderRadius.all(theme.radius.small);
    if (enableMinSize) {
      localChild = ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: kMinInteractiveDimensionCupertino,
          minWidth: kMinInteractiveDimensionCupertino,
        ),
        child: localChild,
      );
    }

    Widget tap = ClipRRect(
      borderRadius: localBorderRadius,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          borderRadius: localBorderRadius,
          child: localChild,
        ),
      ),
    );

    if (localFit != null) {
      tap = FittedBox(
        fit: localFit,
        child: tap,
      );
    }

    return tap;
  }
}
