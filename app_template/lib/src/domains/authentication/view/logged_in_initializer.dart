import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/feature_toggle.dart';

import 'package:app_template/src/domains/authentication/logic/authentication_providers.dart';
import 'package:template_theme/theme/layout/splash_icon.dart';

class LoggedInInitializer extends ConsumerWidget {
  const LoggedInInitializer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUserLoggedInAsync = ref.watch(isUserLoggedInProviderAsync);

    // TODO: ⚠️ Remove this when the authentication will be implemented.
    if (ref.watch(overrideIsloggedInProvider)) {
      return ProviderScope(
        key: UniqueKey(),
        overrides: [isUserLoggedInProvider.overrideWithValue(true)],
        child: child,
      );
    }

    return isUserLoggedInAsync.when(
      isLoggedIn: () {
        return ProviderScope(
          overrides: [isUserLoggedInProvider.overrideWithValue(true)],
          child: child,
        );
      },
      isNotLoggedIn: () => ProviderScope(
        overrides: [isUserLoggedInProvider.overrideWithValue(false)],
        child: child,
      ),
      isLoggingIn: () => const AppSplashIcon(),
    );
  }
}
