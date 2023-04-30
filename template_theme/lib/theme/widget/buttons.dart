import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_theme/theme/data/theme_data.dart';
import 'package:template_theme/theme/widget/loader.dart';
import 'package:template_theme/theme/widget/texts.dart';

enum _ButtonType { primary, secondary, tertiary }

const kButtonMinimumSize = Size(64, kMinInteractiveDimensionCupertino);

class AppButton extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final void Function()? onPressed;
  final _ButtonType _buttonType;
  final bool isLoading;
  final bool iconOnRight;
  final bool isExpanded;
  final EdgeInsets? padding;

  const AppButton.primary({
    Key? key,
    this.icon,
    this.label,
    required this.onPressed,
    this.isLoading = false,
    this.iconOnRight = false,
    this.isExpanded = false,
    this.padding,
  })  : _buttonType = _ButtonType.primary,
        super(key: key);

  const AppButton.secondary({
    Key? key,
    this.icon,
    this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
    this.iconOnRight = false,
    this.padding,
  })  : _buttonType = _ButtonType.secondary,
        super(key: key);

  const AppButton.tertiary({
    Key? key,
    this.icon,
    this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
    this.iconOnRight = false,
    this.padding,
  })  : _buttonType = _ButtonType.tertiary,
        super(key: key);

  getContentColor(BuildContext context, {required bool isDisabled}) {
    final colors = Theme.of(context).colors;
    switch (_buttonType) {
      case _ButtonType.primary:
        return colors.white;
      case _ButtonType.secondary:
        if (isDisabled) return colors.backgroundSecondary;
        if (isLoading) return colors.brandPrimary;
        return colors.brandPrimary;
      case _ButtonType.tertiary:
        if (isDisabled) return colors.textSecondary;
        if (isLoading) return colors.brandPrimary;
        return colors.brandPrimary;
    }
  }

  /// Get the button style for the given AppButton type.
  /// The style is computed based on the current theme.
  ButtonStyle getButtonStyle(
    BuildContext context, {
    required bool isDisabled,
    required Color contentColor,
  }) {
    final theme = Theme.of(context);
    final sizes = theme.sizes;

    final backgroundColor = () {
      switch (_buttonType) {
        case _ButtonType.primary:
          if (isDisabled) return theme.colors.backgroundSecondary;
          if (isLoading) return theme.colors.brandPrimary;
          return theme.colors.brandPrimary;
        case _ButtonType.secondary:
          return theme.colors.white;
        case _ButtonType.tertiary:
          return null;
      }
    }();

    switch (_buttonType) {
      case _ButtonType.primary:
        final computedPadding = padding ??
            EdgeInsets.symmetric(vertical: sizes.xs, horizontal: sizes.s);
        return ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(kButtonMinimumSize),
          elevation: MaterialStateProperty.all<double>(0),
          padding: MaterialStateProperty.all<EdgeInsets>(computedPadding),
          backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      case _ButtonType.secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: backgroundColor,
          minimumSize: kButtonMinimumSize,
          elevation: 0,
          padding: padding,
          side: BorderSide(color: contentColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      case _ButtonType.tertiary:
        return TextButton.styleFrom(
          minimumSize: kButtonMinimumSize,
          elevation: 0,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
    }
  }

  /// Used to calculate the child of the button by taking into account button's
  /// parameters and the loading state.
  getButtonChild(
    BuildContext context, {
    required Color contentColor,
    required String? localLabel,
  }) {
    final theme = Theme.of(context);

    final buttonIcon = isLoading
        ? AppLoader.small(color: contentColor)
        : Icon(icon, size: theme.sizes.s, color: contentColor);

    if (localLabel == null) return buttonIcon;

    if (icon == null) {
      // We use a Stack with an Opacity widgets to avoid button to shrink when loading
      return Stack(
        alignment: Alignment.center,
        children: [
          if (isLoading) AppLoader.small(color: contentColor),
          Opacity(
            opacity: isLoading ? 0 : 1,
            child: AppText.button(
              localLabel,
              fontWeight: FontWeight.w600,
              color: contentColor,
              textDecoration: _buttonType == _ButtonType.tertiary
                  ? TextDecoration.underline
                  : null,
            ),
          ),
        ],
      );
    }

    final double scale = MediaQuery.of(context).textScaleFactor;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonIcon,
        SizedBox(width: gap),
        Flexible(
          child: AppText.button(
            localLabel,
            fontWeight: FontWeight.w600,
            color: contentColor,
          ),
        )
      ],
    );
  }

  // Currently we use TextDirection and Directionality to place the icon
  // There is no proper prop to use to do it
  // There is an open issue on the Flutter repo to do it : https://github.com/flutter/flutter/issues/71941
  TextDirection getTextDirection() {
    if (icon == null) return TextDirection.ltr;
    if (!iconOnRight) return TextDirection.ltr;
    return TextDirection.rtl;
  }

  @override
  Widget build(BuildContext context) {
    final localLabel = label;
    final isDisabled = onPressed == null && !isLoading;
    final onButtonPress = isDisabled ? null : onPressed;

    final contentColor = getContentColor(context, isDisabled: isDisabled);

    final style = getButtonStyle(
      context,
      isDisabled: isDisabled,
      contentColor: contentColor,
    );

    final buttonChild = getButtonChild(
      context,
      contentColor: contentColor,
      localLabel: localLabel,
    );

    late Widget button;
    switch (_buttonType) {
      case _ButtonType.primary:
        button = ElevatedButton(
          style: style,
          onPressed: onButtonPress,
          child: _ExpandedWrapper(isExpanded: isExpanded, child: buttonChild),
        );
        break;
      case _ButtonType.secondary:
        button = OutlinedButton(
          style: style,
          onPressed: onButtonPress,
          child: _ExpandedWrapper(isExpanded: isExpanded, child: buttonChild),
        );
        break;
      case _ButtonType.tertiary:
        button = TextButton(
          style: style,
          onPressed: onButtonPress,
          child: _ExpandedWrapper(isExpanded: isExpanded, child: buttonChild),
        );
        break;
    }

    return Directionality(textDirection: getTextDirection(), child: button);
  }
}

class _ExpandedWrapper extends StatelessWidget {
  const _ExpandedWrapper({
    Key? key,
    required this.child,
    required this.isExpanded,
  }) : super(key: key);

  final Widget child;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [child],
      );
    }
    return child;
  }
}
