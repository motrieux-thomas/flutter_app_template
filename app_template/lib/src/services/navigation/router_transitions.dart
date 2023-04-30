import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef GoRouterPageTransition = CustomTransitionPage Function(
  GoRouterState state,
  Widget child,
);

CustomTransitionPage<T> buildPageWithDefaultTransition<T>(
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
