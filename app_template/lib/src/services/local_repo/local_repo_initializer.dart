import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/services/local_repo/local_repo_providers.dart';
import 'package:app_template/src/services/error_logger/error_logger_providers.dart';
import 'package:template_theme/template_theme.dart';
import 'package:stateful/stateful.dart';

class LocalRepoInitializer extends ConsumerWidget {
  const LocalRepoInitializer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localRepoAsync = ref.watch(localRepoFutureProvider);
    final errorLogger = ref.watch(errorLoggerProvider);

    return localRepoAsync.when(
      data: (localRepo) => ProviderScope(
        overrides: [localRepoProvider.overrideWithValue(localRepo)],
        child: child,
      ),
      error: (e, st) => Initializer(
        initialize: (_) {
          errorLogger.captureException(e, stackTrace: st);
        },
        child: const AppSplashIcon(),
      ),
      loading: () => const AppSplashIcon(),
    );
  }
}
