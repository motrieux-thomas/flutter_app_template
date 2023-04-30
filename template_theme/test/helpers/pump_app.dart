import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(theme: lightTheme, home: widget),
    );
  }
}
