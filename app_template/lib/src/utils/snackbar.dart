import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template_theme/template_theme.dart';

/// Don't forget to call the function if it's not used as a callback
Future<void> Function() showSnackBarOnError(
  BuildContext context,
  Future<void> Function() function, {
  Future<void> Function()? onError,
  Future<void> Function()? finallyFn,
  SnackBarData? Function(Object err)? messageOnError,
  bool withRetryAction = true,
}) {
  // We wrap to minimize integration cost
  Future<void> wrappedFunction() async {
    try {
      await function();
    } catch (err, __) {
      final locales = AppLocalizations.of(context)!;

      final message = () {
        final customMessage = messageOnError?.call(err);
        if (customMessage != null) return customMessage;
        return SnackBarData(
          title: locales.errorTitle,
          actionLabel: withRetryAction ? locales.errorRetryLabel : null,
          description: locales.errorDescription,
        );
      }();

      AppSnackBar.showError(
        context,
        ctaCallBack: wrappedFunction,
        message: message,
      );

      if (onError != null) await onError();
    } finally {
      if (finallyFn != null) await finallyFn();
    }
  }

  return wrappedFunction;
}

/// Don't forget to call the function if it's not
/// used as a callback
Future<void> Function() showSnackBarOnComplete(
  BuildContext context,
  Future<void> Function() function, {
  required SnackBarData successMessage,
  Future<void> Function()? onSuccess,
  Future<void> Function()? finallyFn,
  SnackBarData? Function(Object err)? messageOnError,
}) {
  // We wrap to minimize integration cost
  Future<void> wrappedFunction() async {
    try {
      await function().then((value) {
        AppSnackBar.showSuccess(
          context,
          ctaCallBack: onSuccess,
          message: successMessage,
        );
      });
    } catch (err) {
      final locales = AppLocalizations.of(context)!;

      final message = () {
        final customMessage = messageOnError?.call(err);
        if (customMessage != null) return customMessage;
        return SnackBarData(
          title: locales.errorTitle,
          actionLabel: locales.errorRetryLabel,
          description: locales.errorDescription,
        );
      }();

      AppSnackBar.showError(
        context,
        ctaCallBack: wrappedFunction,
        message: message,
      );
    } finally {
      if (finallyFn != null) await finallyFn();
    }
  }

  return wrappedFunction;
}
