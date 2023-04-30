import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:template_theme/theme/widget/gap.dart';
import 'package:template_theme/theme/widget/texts.dart';
import 'package:template_theme/theme/data/theme_data.dart';

class SnackBarData extends Equatable {
  const SnackBarData({
    required this.description,
    this.title,
    this.actionLabel,
  });

  final String? title;
  final String description;
  final String? actionLabel;

  @override
  List<Object?> get props => [title, description, actionLabel];
}

class AppSnackBar extends SnackBar {
  AppSnackBar({
    required super.content,
    super.key,
    super.backgroundColor,
    super.margin,
    super.elevation = 0,
    super.duration = const Duration(seconds: 6),
    super.behavior = SnackBarBehavior.floating,
    required Color borderColor,
    Future<void> Function()? ctaCallBack,
    String? retryLabel,
    double borderWidth = 2,
    Color? actionTextColor,
  }) : super(
          shape: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          action: ctaCallBack != null && retryLabel != null
              ? SnackBarAction(
                  textColor: actionTextColor,
                  label: retryLabel,
                  onPressed: ctaCallBack,
                )
              : null,
        );

  /// Show an error SnackBar, use it in a `Scaffold`.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
    BuildContext context, {
    required SnackBarData message,
    Future<void> Function()? ctaCallBack,
    EdgeInsets? margin,
    Duration? duration,
  }) {
    final backgroundColor = Theme.of(context).colors.redDullest;

    return ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(
        backgroundColor: backgroundColor,
        content: _AppSnackbarContent(
          description: message.description,
          title: message.title,
          textColor: Colors.black87,
        ),
        ctaCallBack: ctaCallBack,
        retryLabel: message.actionLabel,
        actionTextColor: Colors.black87,
        borderColor: Theme.of(context).colors.red,
        margin: margin,
        duration: duration ?? const Duration(seconds: 6),
      ),
    );
  }

  /// Show an information SnackBar, use it in a `Scaffold`.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showInfo(
    BuildContext context, {
    required SnackBarData message,
  }) {
    final backgroundColor = Theme.of(context).colors.backgroundSecondary;

    return ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(
        backgroundColor: backgroundColor,
        content: _AppSnackbarContent(
          description: message.description,
          title: message.title,
          textColor: Theme.of(context).colors.textPrimary,
        ),
        actionTextColor: Theme.of(context).colors.textPrimary,
        borderColor: Theme.of(context).colors.backgroundInverted,
      ),
    );
  }

  /// Show an success SnackBar, use it in a `Scaffold`.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
    BuildContext context, {
    required SnackBarData message,
    Future<void> Function()? ctaCallBack,
  }) {
    final backgroundColor = Theme.of(context).colors.greenDullest;

    return ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(
        backgroundColor: backgroundColor,
        content: _AppSnackbarContent(
          description: message.description,
          title: message.title,
          textColor: Theme.of(context).colors.black,
        ),
        ctaCallBack: ctaCallBack,
        retryLabel: message.actionLabel,
        actionTextColor: Theme.of(context).colors.black,
        borderColor: Theme.of(context).colors.green,
      ),
    );
  }

  /// Show an warning SnackBar, use it in a `Scaffold`.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showWarning(
    BuildContext context, {
    required SnackBarData message,
    Future<void> Function()? ctaCallBack,
  }) {
    final backgroundColor = Colors.yellow[300]!;

    return ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(
        backgroundColor: backgroundColor,
        content: _AppSnackbarContent(
          description: message.description,
          title: message.title,
          textColor: Theme.of(context).colors.textPrimary,
        ),
        ctaCallBack: ctaCallBack,
        retryLabel: message.actionLabel,
        actionTextColor: Theme.of(context).colors.textPrimary,
        borderColor: Colors.yellow,
      ),
    );
  }
}

class _AppSnackbarContent extends StatelessWidget {
  const _AppSnackbarContent({
    Key? key,
    required this.description,
    required this.textColor,
    this.title,
  }) : super(key: key);

  final String? title;
  final String description;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final localTitle = title;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (localTitle != null) ...[
          AppText.p1(localTitle, color: textColor),
          const AppGap.medium(),
        ],
        AppText.p2(description, color: textColor)
      ],
    );
  }
}
