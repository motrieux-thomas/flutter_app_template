// coverage:ignore-file

// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

class StandardKeyboardSizes {
  const StandardKeyboardSizes._();
<<<<<<< Updated upstream
  static const Size iPhoneSE = Size(320, 182);
  static const Size iPhone8 = Size(375, 218);
  static const Size iPhone13 = Size(390, 302);
  static const Size iPadMini = Size(1133, 348);
  static const Size iPadProLandscape = Size(1366, 420);
  static const Size iPadProPortrait = Size(1024, 407);
=======

  static const Size iPhoneSE = Size(320, 182);
  static const Size iPhone8 = Size(375, 218);
  static const Size iPhone13 = Size(390, 302);
>>>>>>> Stashed changes
}

class _TestWindowPadding implements WindowPadding {
  const _TestWindowPadding({required this.bottom});

  @override
  final double bottom;

  @override
  double get top => 0.0;

  @override
  double get left => 0.0;

  @override
  double get right => 0.0;
}

class StandardPixelDensity {
  const StandardPixelDensity._();
  static const double iPhoneSE = 2.0;
  static const double iPhone8 = 2.0;
  static const double iPhone13 = 3.0;
}

class StandardWindowSizes {
  const StandardWindowSizes._();

  static const Size iPhoneSE = Size(
    320 * StandardPixelDensity.iPhoneSE,
    568 * StandardPixelDensity.iPhoneSE,
  );

  static const Size iPhone8 = Size(
    375 * StandardPixelDensity.iPhone8,
    667 * StandardPixelDensity.iPhone8,
  );

  static const Size iPhone13 = Size(
    390 * StandardPixelDensity.iPhone13,
    844 * StandardPixelDensity.iPhone13,
  );
}

class StandardViewInsets {
  const StandardViewInsets._();

  static WindowPadding iPhoneSE = _TestWindowPadding(
    bottom:
        StandardKeyboardSizes.iPhoneSE.height * StandardPixelDensity.iPhoneSE,
  );

  static WindowPadding iPhone8 = _TestWindowPadding(
    bottom: StandardKeyboardSizes.iPhone8.height * StandardPixelDensity.iPhone8,
  );

  static WindowPadding iPhone13 = _TestWindowPadding(
    bottom:
        StandardKeyboardSizes.iPhone13.height * StandardPixelDensity.iPhone13,
  );
}

class StandardWindowInfos {
  const StandardWindowInfos({
    required this.name,
    required this.pixelDensity,
    required this.size,
    required this.viewInsets,
    required this.keyboardSize,
  });

  final Size size;
  final String name;
  final double pixelDensity;
  final WindowPadding viewInsets;
  final Size keyboardSize;

  static StandardWindowInfos iPhoneSE = StandardWindowInfos(
    name: "iPhone_SE",
    size: StandardWindowSizes.iPhoneSE,
    pixelDensity: StandardPixelDensity.iPhoneSE,
    viewInsets: StandardViewInsets.iPhoneSE,
    keyboardSize: StandardKeyboardSizes.iPhoneSE,
  );

  static StandardWindowInfos iPhone8 = StandardWindowInfos(
    name: "iPhone_8",
    size: StandardWindowSizes.iPhone8,
    pixelDensity: StandardPixelDensity.iPhone8,
    viewInsets: StandardViewInsets.iPhone8,
    keyboardSize: StandardKeyboardSizes.iPhone8,
  );

  static StandardWindowInfos iPhone13 = StandardWindowInfos(
    name: "iPhone_13",
    size: StandardWindowSizes.iPhone13,
    pixelDensity: StandardPixelDensity.iPhone13,
    viewInsets: StandardViewInsets.iPhone13,
    keyboardSize: StandardKeyboardSizes.iPhone13,
  );
}

class AppValueVariant<StandardWindowInfos>
    extends ValueVariant<StandardWindowInfos> {
  AppValueVariant(this.standardWindowInfosValues)
      : super(standardWindowInfosValues);

  final Set<StandardWindowInfos> standardWindowInfosValues;

  @override
  String describeValue(StandardWindowInfos value) {
    try {
      final String valueName = (value as dynamic).name;
      return valueName;
    } catch (_) {
      return 'Default';
    }
  }
}

final responsiveVariant = AppValueVariant<StandardWindowInfos>({
  StandardWindowInfos.iPhoneSE,
  StandardWindowInfos.iPhone8,
  StandardWindowInfos.iPhone13,
});
