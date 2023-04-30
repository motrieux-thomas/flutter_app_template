import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/theme/extensions.dart';

void main() {
  test('EdgeInsets extension', () {
    const padding = EdgeInsets.all(10);

    expect(
      padding.verticalOnly,
      equals(const EdgeInsets.symmetric(vertical: 10)),
    );

    expect(
      padding.horizontalOnly,
      equals(const EdgeInsets.symmetric(horizontal: 10)),
    );

    expect(
      padding.bottomOnly,
      equals(const EdgeInsets.only(bottom: 10)),
    );

    expect(
      padding.topOnly,
      equals(const EdgeInsets.only(top: 10)),
    );

    expect(
      padding.leftOnly,
      equals(const EdgeInsets.only(left: 10)),
    );

    expect(
      padding.rightOnly,
      equals(const EdgeInsets.only(right: 10)),
    );
  });

  test('Colors toHex extension', () {
    expect(const Color(0xFFF37535).toHex(), equals("#f37535"));
  });

  test('ThemeData getThemeData extension return the correct value', () {
    expect(
      ThemeMode.light.themeData.brightness,
      equals(Brightness.light),
    );
    expect(
      ThemeMode.system.themeData.brightness,
      equals(Brightness.light),
    );
    expect(
      ThemeMode.dark.themeData.brightness,
      equals(Brightness.dark),
    );
  });
}
