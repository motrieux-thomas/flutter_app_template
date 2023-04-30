// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:recase/recase.dart';
// The test_api package is not for general use... it's literally for our use.
// ignore: deprecated_member_use
import 'package:test_api/test_api.dart' as test_package;

typedef ResponsiveWidgetTesterCallback = Future<void> Function(
  WidgetTester widgetTester,
  ValueVariant<StandardWindowInfos> variant,
);

@isTest
void testResponsiveWidgets(
  String description,
  ResponsiveWidgetTesterCallback callback, {
  bool? skip,
  test_package.Timeout? timeout,
  bool semanticsEnabled = true,
  dynamic tags,
}) {
  final variant = responsiveVariant;
  testWidgets(
    description,
    (tester) async {
      await tester.setScreenSize(variant.currentValue!);
      await callback(tester, variant);
    },
    skip: skip,
    timeout: timeout,
    semanticsEnabled: semanticsEnabled,
    variant: variant,
    tags: tags,
  );
}

extension Responsive on WidgetTester {
  setScreenSize(StandardWindowInfos windowInfos) {
    binding.window.devicePixelRatioTestValue = windowInfos.pixelDensity;
    binding.window.physicalSizeTestValue = windowInfos.size;

    addTearDown(binding.window.clearPhysicalSizeTestValue);
    addTearDown(
      binding.window.clearDevicePixelRatioTestValue,
    );
    addTearDown(binding.window.clearViewInsetsTestValue);
  }

  Future<void> expectGolden<T>(
    StandardWindowInfos windowInfos, {
    bool showKeyBoard = false,
    String? suffix,
    String? customName,
    // Sometimes we want to find the widget by his unique key in the case they are many one with the same type in the pile.
    Key? bykey,
  }) async {
    final localSuffix = suffix != null ? "_${ReCase(suffix).snakeCase}" : '';
    if (showKeyBoard) {
      binding.window.viewInsetsTestValue = windowInfos.viewInsets;
    }

    final name = customName ?? ReCase('$T').snakeCase;
    await expectLater(
      // Find by his type except if the widget's unique key was given.
      bykey != null ? find.byKey(bykey) : find.byType(T),
      matchesGoldenFileWithRules(
        '${windowInfos.name}: $name$localSuffix.png',
      ),
    );

    if (showKeyBoard) {
      binding.window.clearViewInsetsTestValue();
    }
  }
}
