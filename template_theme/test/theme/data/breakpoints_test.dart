import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets(
    'BreakpointsThemeData.main() Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();
      final widget = Builder(
        builder: (_) => Container(key: key),
      );

      await tester.pumpApp(widget);
      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.breakpoints, equals(BreakpointsThemeData.main()));
    },
  );

  testResponsiveWidgets(
    'Content with constraints',
    (tester, variant) async {
      final widget = Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  AppText.smallTitle(
                    "Is Tablet: ${context.isTablet.toString()}",
                  ),
                  const AppGap.big(),
                  AppText.smallTitle(
                    "Is Small Phone: ${context.isSmallPhone.toString()}",
                  ),
                  const AppGap.big(),
                  AppText.smallTitle(
                    "Window orientation: ${context.windowOrientation.name}",
                  ),
                  const AppGap.big(),
                  AppText.smallTitle(
                    "Width Size class: ${context.widthSizeClass.name}",
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.pumpApp(widget);

      await tester.expectGolden<Scaffold>(
        variant.currentValue!,
        suffix: 'window_information',
      );
    },
  );
}
