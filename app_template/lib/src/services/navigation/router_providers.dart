import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/src/domains/authentication/logic/authentication_providers.dart';
import 'package:app_template/src/services/navigation/navigation_paths.dart';

/// Used to force a redirection after that app has been reloaded.
final redirectAfterAppReloadProvider = StateProvider<String?>((ref) => null);

/// Used to determine if the router can pop in a given context.
final routerCanPopProvider = Provider.family.autoDispose<bool, BuildContext>(
  (ref, context) {
    final isCurrent = ModalRoute.of(context)?.isCurrent ?? false;
    return context.canPop() && isCurrent;
  },
);

/// The [fallbackPathProvider] is used the default fallback path.
final fallbackPathProvider = Provider<AppPath>((ref) {
  if (ref.watch(isUserLoggedInProvider)) return Paths.homepage;
  return Paths.login;
}, dependencies: [isUserLoggedInProvider]);
