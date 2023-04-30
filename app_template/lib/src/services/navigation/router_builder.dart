import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/src/domains/authentication/logic/authentication_providers.dart';
import 'package:app_template/src/domains/authentication/view/login_layout.dart';
import 'package:app_template/src/domains/cheat_code/view/cheat_code_layout.dart';
import 'package:app_template/src/domains/homepage/view/homepage_layout.dart';
import 'package:app_template/src/services/error_logger/error_logger_providers.dart';
import 'package:app_template/src/services/navigation/navigation_paths.dart';
import 'package:app_template/src/services/navigation/navigation_wrapper.dart';
import 'package:app_template/src/services/navigation/router_providers.dart';
import 'package:app_template/src/services/navigation/router_transitions.dart';

class GoRouterBuilder extends ConsumerStatefulWidget {
  const GoRouterBuilder({
    Key? key,
    required this.builder,
    this.initialLocation = Paths.initial,
  }) : super(key: key);

  final String initialLocation;

  final Widget Function(BuildContext context, GoRouter goRouter) builder;

  @override
  GoRouterBuilderState createState() => GoRouterBuilderState();
}

class GoRouterBuilderState extends ConsumerState<GoRouterBuilder> {
  CustomTransitionPage buildNavigationWrapper(
    GoRouterState state,
    Widget child, {
    hasNavigationBar = true,
    GoRouterPageTransition pageTransition = buildPageWithDefaultTransition,
  }) {
    return pageTransition(
      state,
      NavigationWrapper(
        currentLocation: state.location,
        hasNavigationBar: hasNavigationBar,
        child: child,
      ),
    );
  }

  late final goRouter = GoRouter(
    observers: [
      ref.read(errorLoggerProvider).navigatorObserver,
    ],
    initialLocation: widget.initialLocation,
    routes: [
      GoRoute(
        path: Paths.initial,
        redirect: (_, __) => Paths.homepage.location,
      ),
      GoRoute(
        path: Paths.homepage.path,
        name: Paths.homepage.name,
        pageBuilder: (_, state) => buildNavigationWrapper(
          state,
          HomepageLayout(key: UniqueKey()),
        ),
      ),
      GoRoute(
        path: Paths.login.path,
        name: Paths.login.name,
        builder: (_, state) => LoginLayout(key: UniqueKey()),
      ),
      GoRoute(
        path: Paths.cheatCode.path,
        name: Paths.cheatCode.name,
        builder: (_, state) => CheatCodeLayout(key: UniqueKey()),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      // Default fallback for invalid gate.
      final fallbackPath = ref.read(fallbackPathProvider).path;

      /// Logging redirection
      final isUserLoggedIn = ref.read(isUserLoggedInProvider);
      final loggingIn = state.subloc.contains(Paths.login.path);

      if (!isUserLoggedIn) return loggingIn ? null : Paths.login.path;
      // If the user is logged in but still on the login page, send them to the home page.
      if (loggingIn) return fallbackPath;

      /// After reload redirection override.
      String? nextRedirection = ref.read(redirectAfterAppReloadProvider);
      // Reset the override after the redirection.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(redirectAfterAppReloadProvider.notifier).state = null;
      });

      // Block infinite redirection.
      return nextRedirection == state.location ? null : nextRedirection;
    },
  );

  @override
  Widget build(BuildContext context) => widget.builder(context, goRouter);
}
