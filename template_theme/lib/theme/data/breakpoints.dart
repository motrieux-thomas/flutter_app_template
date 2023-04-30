import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_theme/template_theme.dart';

const kTabletShortestSide = 720.0;
const kSmallPhoneShortestSide = 375.0;
const kContentMaxWidth = 560.0;

enum WindowOrientation {
  portrait,
  landscape,
}

enum SizeClass {
  regular,
  compact,
}

class BreakpointsThemeData extends Equatable {
  const BreakpointsThemeData({
    required this.tabletShortestSide,
    required this.contentMaxWidth,
    required this.smallPhoneShortestSide,
  });

  final double tabletShortestSide;
  final double smallPhoneShortestSide;
  final double contentMaxWidth;

  factory BreakpointsThemeData.main() {
    return const BreakpointsThemeData(
      contentMaxWidth: kContentMaxWidth,
      tabletShortestSide: kTabletShortestSide,
      smallPhoneShortestSide: kSmallPhoneShortestSide,
    );
  }

  @override
  List<Object?> get props => [
        tabletShortestSide,
        contentMaxWidth,
      ];
}

extension Breakpoints on BuildContext {
  bool get isTablet {
    final mediaQuery = MediaQuery.of(this);
    final theme = Theme.of(this);
    return mediaQuery.size.shortestSide > theme.breakpoints.tabletShortestSide;
  }

  bool get isSmallPhone {
    final mediaQuery = MediaQuery.of(this);
    final theme = Theme.of(this);
    return mediaQuery.size.shortestSide <
        theme.breakpoints.smallPhoneShortestSide;
  }

  WindowOrientation get windowOrientation {
    final mediaQuery = MediaQuery.of(this);
    if (mediaQuery.size.aspectRatio > 1) {
      return WindowOrientation.landscape;
    }
    return WindowOrientation.portrait;
  }

  SizeClass get widthSizeClass {
    final mediaQuery = MediaQuery.of(this);
    if (mediaQuery.size.aspectRatio > 2 / 3) {
      return SizeClass.regular;
    }
    return SizeClass.compact;
  }
}

/// Return a bool that indicate if the device is a tablet.
///
/// be sure that `WidgetsFlutterBinding.ensureInitialized();` has been call
/// before calling `isDeviceTablet`.
///
/// is used when app start.
/// But it's not always true (app can be started in multitask).
///
/// Use it when context is not available.
/// It will not trigger rebuild on app resize.
bool isDeviceTablet() {
  final physicalShortestSide =
      WidgetsBinding.instance.window.physicalSize.shortestSide;
  final devicePixelRatio = WidgetsBinding.instance.window.devicePixelRatio;

  final shortestSide = physicalShortestSide / devicePixelRatio;
  final isTablet = shortestSide > kTabletShortestSide;

  return isTablet;
}

/// Set device preferred Orientations depending if it is a tablet or not.
///
/// be sure that `WidgetsFlutterBinding.ensureInitialized();` has been call
/// before calling `setDevicePreferredOrientations`.
Future<void> setDevicePreferredOrientations() async {
  if (isDeviceTablet()) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } else {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}

/// Flutter Theme extension
/// It's use in association with a Dart ThemeData class extension.
class BreakpointsThemeDataExtension
    extends ThemeExtension<BreakpointsThemeDataExtension> {
  const BreakpointsThemeDataExtension({
    required this.breakpoints,
  });

  final BreakpointsThemeData breakpoints;

  // coverage:ignore-start
  @override
  BreakpointsThemeDataExtension copyWith({
    BreakpointsThemeData? breakpoints,
  }) {
    return BreakpointsThemeDataExtension(
      breakpoints: breakpoints ?? this.breakpoints,
    );
  }

  @override
  BreakpointsThemeDataExtension lerp(
    ThemeExtension<BreakpointsThemeDataExtension>? other,
    double t,
  ) {
    return this;
  }
  // coverage:ignore-end
}
