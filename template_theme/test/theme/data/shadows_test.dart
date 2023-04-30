import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/data/colors.dart';
import 'package:template_theme/theme/data/shadows.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('ShadowsThemeData.light() Should render shadows', (tester) async {
    // Enable shadows
    debugDisableShadows = false;

    final shadows = ShadowsThemeData.light();

    final shadowsBox = shadows.props.map((shadow) {
      return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
          color: ColorsThemeData.light().black,
          boxShadow: [shadow as BoxShadow],
        ),
      );
    }).toList();

    final key = UniqueKey();
    await tester.pumpApp(
      Container(
        key: key,
        width: 180,
        color: Colors.white,
        child: Column(
          children: [...shadowsBox],
        ),
      ),
    );

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('shadows/shadows_test.png'),
    );

    // Set the flag back to normal
    debugDisableShadows = true;
  });

  testWidgets(
    'ShadowsThemeData Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();
      final widget = Builder(
        builder: (_) => Container(key: key),
      );

      await tester.pumpApp(widget);
      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.shadows, equals(ShadowsThemeData.light()));
    },
  );
}
