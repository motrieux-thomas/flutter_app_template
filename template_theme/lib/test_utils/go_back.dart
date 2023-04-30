// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// We need to ignore this file from coverage because we can not
// test the case with router delegate in template_theme package.
// There is a test in app_template that handle this use case
// coverage:ignore-file

extension Utils on WidgetTester {
  Future<void> goBack() async {
    final materialAppWidget =
        firstWidget(find.byType(MaterialApp)) as MaterialApp;
    final hasRouterDelegate = materialAppWidget.routerDelegate != null;

    if (hasRouterDelegate) {
      final widget = find.byType(Navigator).last;
      final NavigatorState widgetsAppState = state(widget);
      widgetsAppState.pop();
    } else {
      final dynamic widgetsAppState = state(find.byType(WidgetsApp));
      await widgetsAppState.didPopRoute();
    }

    await pump();
  }
}
