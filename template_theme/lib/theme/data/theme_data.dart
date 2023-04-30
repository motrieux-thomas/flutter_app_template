import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_theme/theme/data/breakpoints.dart';
import 'package:template_theme/theme/data/colors.dart';
import 'package:template_theme/theme/data/durations.dart';
import 'package:template_theme/theme/data/insets.dart';
import 'package:template_theme/theme/data/radius.dart';
import 'package:template_theme/theme/data/shadows.dart';
import 'package:template_theme/theme/data/sizes.dart';
import 'package:template_theme/theme/data/texts.dart';

final primarySwatch = {
  50: Colors.black87.withOpacity(.1),
  100: Colors.black87.withOpacity(.2),
  200: Colors.black87.withOpacity(.3),
  300: Colors.black87.withOpacity(.4),
  400: Colors.black87.withOpacity(.5),
  500: Colors.black87.withOpacity(.6),
  600: Colors.black87.withOpacity(.7),
  700: Colors.black87.withOpacity(.8),
  800: Colors.black87.withOpacity(.9),
  900: Colors.black87.withOpacity(1),
};

ThemeData get lightTheme {
  final lightColors = ColorsThemeData.light();
  final radius = RadiusThemeData.main();
  final textStyle = TextData.getMainTheme;

  final extensions = [
    ..._getCommonExtensions(),
    ColorsThemeDataExtension(colors: lightColors),
    ShadowsThemeDataExtension(shadows: ShadowsThemeData.light()),
  ];

  return ThemeData(
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: lightColors.black,
      textTheme: TextData.getCupertinoTheme.copyWith(
        primaryColor: lightColors.black,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: lightColors.textPrimary,
      labelStyle: textStyle.titleSmall?.copyWith(fontWeight: FontWeight.w700),
      unselectedLabelColor: lightColors.textPrimary,
      unselectedLabelStyle: textStyle.bodyMedium?.copyWith(fontSize: 16),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: lightColors.textPrimary, width: 2),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(lightColors.black.value, primarySwatch),
      brightness: Brightness.light,
    ),
    checkboxTheme: CheckboxThemeData(
      side: MaterialStateBorderSide.resolveWith(
        (states) {
          return BorderSide(color: lightColors.textPrimary);
        },
      ),
      checkColor: MaterialStateProperty.all(lightColors.textPrimary),
      visualDensity: VisualDensity.compact,
      fillColor: MaterialStateProperty.all(lightColors.backgroundSecondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(radius.small),
      ),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    switchTheme: _switchTheme(lightColors),
    textTheme: textStyle,
    primaryColor: lightColors.brandPrimary,
    scaffoldBackgroundColor: lightColors.backgroundPrimary,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    extensions: extensions,
  );
}

// coverage:ignore-start

ThemeData get darkTheme {
  final darkColors = ColorsThemeData.dark();
  final radius = RadiusThemeData.main();
  final textStyle = TextData.getMainTheme;

  final extensions = [
    ..._getCommonExtensions(),
    ColorsThemeDataExtension(colors: darkColors),
    ShadowsThemeDataExtension(shadows: ShadowsThemeData.dark()),
  ];

  return ThemeData(
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: TextData.getCupertinoTheme.copyWith(
        primaryColor: darkColors.black,
      ),
      primaryColor: darkColors.black,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: darkColors.textPrimary,
      labelStyle: textStyle.titleSmall?.copyWith(fontWeight: FontWeight.w700),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: darkColors.textPrimary),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(darkColors.black.value, primarySwatch),
      brightness: Brightness.dark,
    ),
    checkboxTheme: CheckboxThemeData(
      side: MaterialStateBorderSide.resolveWith(
        (states) {
          return BorderSide(color: darkColors.textPrimary);
        },
      ),
      checkColor: MaterialStateProperty.all(darkColors.textPrimary),
      visualDensity: VisualDensity.compact,
      fillColor: MaterialStateProperty.all(darkColors.backgroundSecondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(radius.small),
      ),
    ),
    switchTheme: _switchTheme(darkColors),
    textTheme: textStyle,
    primaryColor: darkColors.brandPrimary,
    scaffoldBackgroundColor: darkColors.backgroundPrimary,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    extensions: extensions,
  );
}

SwitchThemeData _switchTheme(ColorsThemeData colors) {
  return SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled)) {
        return colors.black.withOpacity(.48);
      }
      return colors.green;
    }),
    trackColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled)) {
        return colors.black.withOpacity(.48);
      }
      return colors.green.withOpacity(.48);
    }),
  );
}

// coverage:ignore-end

List<ThemeExtension<dynamic>> _getCommonExtensions() {
  return [
    BreakpointsThemeDataExtension(breakpoints: BreakpointsThemeData.main()),
    DurationsThemeDataExtension(durations: DurationsThemeData.main()),
    InsetsThemeDataExtension(insets: InsetsThemeData.phone()),
    RadiusThemeDataExtension(radius: RadiusThemeData.main()),
    SizesThemeDataExtension(sizes: SizesThemeData.phone())
  ];
}

extension ThemeDataX on ThemeData {
  BreakpointsThemeData get breakpoints {
    return extension<BreakpointsThemeDataExtension>()!.breakpoints;
  }

  ColorsThemeData get colors {
    return extension<ColorsThemeDataExtension>()!.colors;
  }

  DurationsThemeData get durations {
    return extension<DurationsThemeDataExtension>()!.durations;
  }

  InsetsThemeData get insets {
    return extension<InsetsThemeDataExtension>()!.insets;
  }

  RadiusThemeData get radius {
    return extension<RadiusThemeDataExtension>()!.radius;
  }

  ShadowsThemeData get shadows {
    return extension<ShadowsThemeDataExtension>()!.shadows;
  }

  SizesThemeData get sizes {
    return extension<SizesThemeDataExtension>()!.sizes;
  }

  TextTheme get texts => textTheme;
}
