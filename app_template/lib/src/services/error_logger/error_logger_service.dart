import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// We can't mock `Sentry`, SentryErrorMonitoringService is just a wrapper that can be
// mocked.
// coverage:ignore-file

class ErrorLoggerService {
  const ErrorLoggerService({this.ref});

  final Ref? ref;

  Future<SentryId> captureException(
    dynamic throwable, {
    dynamic stackTrace,
    dynamic hint,
    ScopeCallback? withScope,
  }) async {
    return await Sentry.captureException(
      throwable,
      stackTrace: stackTrace,
      hint: hint,
      withScope: withScope,
    );
  }

  Future<SentryId> captureEvent(
    SentryEvent event, {
    dynamic stackTrace,
    dynamic hint,
    ScopeCallback? withScope,
  }) async {
    return await Sentry.captureEvent(
      event,
      stackTrace: stackTrace,
      hint: hint,
      withScope: withScope,
    );
  }

  Future<SentryId> captureMessage(
    String? message, {
    SentryLevel? level = SentryLevel.info,
    String? template,
    List<dynamic>? params,
    dynamic hint,
    ScopeCallback? withScope,
  }) async {
    return await Sentry.captureMessage(
      message,
      level: level,
      template: template,
      params: params,
      hint: hint,
      withScope: withScope,
    );
  }

  SentryNavigatorObserver get navigatorObserver => SentryNavigatorObserver();
}
