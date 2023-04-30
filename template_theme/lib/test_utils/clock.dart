// ignore_for_file: depend_on_referenced_packages

import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template_theme/template_theme_test_utils.dart';
// The test_api package is not for general use... it's literally for our use.
// ignore: deprecated_member_use
import 'package:test_api/test_api.dart' as test_package;

@isTest
void testWidgetsWithClock(
  String description,
  Future<void> Function(WidgetTester widgetTester) callback, {
  bool? skip,
  test_package.Timeout? timeout,
  bool semanticsEnabled = true,
  TestVariant<Object?> variant = const DefaultTestVariant(),
  dynamic tags,
  DateTime? mockDate,
}) {
  final mockClock = Clock.fixed(mockDate ?? DateTime(2022, 01, 15, 12, 0, 0));

  testWidgets(
    description,
    (tester) async {
      await withClock(mockClock, () async {
        await callback(tester);
      });
    },
    skip: skip,
    timeout: timeout,
    semanticsEnabled: semanticsEnabled,
    variant: variant,
    tags: tags,
  );
}

@isTest
void testResponsiveWidgetsWithClock(
  String description,
  ResponsiveWidgetTesterCallback callback, {
  bool? skip,
  test_package.Timeout? timeout,
  bool semanticsEnabled = true,
  dynamic tags,
  DateTime? mockDate,
}) {
  final mockClock = Clock.fixed(mockDate ?? DateTime(2022, 01, 15, 12, 0, 0));

  testResponsiveWidgets(
    description,
    (tester, variant) async {
      await withClock(mockClock, () async {
        await callback(tester, variant);
      });
    },
    skip: skip,
    timeout: timeout,
    semanticsEnabled: semanticsEnabled,
    tags: tags,
  );
}
