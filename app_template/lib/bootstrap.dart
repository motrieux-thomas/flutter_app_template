import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_template/src/app.dart';
import 'package:app_template/src/config/environment_service.dart';
import 'package:app_template/src/services/environment/environment_providers.dart';
import 'package:app_template/src/services/error_logger/keys/sentry_dns.dart';
import 'package:app_template/src/services/error_logger/error_logger_providers.dart';
import 'package:template_theme/template_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> bootstrap({required Environment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await setDevicePreferredOrientations();

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = kSentryDsn;
        options.environment = environment.name;
      },
    );
  }

  runZonedGuarded(() async {
    await Future.wait([
      Hive.initFlutter(),
    ]);

    runApp(
      ProviderScope(
        overrides: [
          envProvider.overrideWithValue(environment),
        ],
        child: const MyApp(),
      ),
    );
  }, (Object error, StackTrace stack) {
    kerrorLogger.captureException(error, stackTrace: stack);
  });
}
