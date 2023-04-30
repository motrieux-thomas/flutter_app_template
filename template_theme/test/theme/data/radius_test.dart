import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/data/radius.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('RadiusThemeData Should render radius', (tester) async {
    final radius = RadiusThemeData.main();

    final radiusBox = radius.props.map((radius) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(radius as Radius),
          color: Colors.white,
        ),
      );
    }).toList();

    final key = UniqueKey();
    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          key: key,
          children: [...radiusBox],
        ),
      ),
    );

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('radius/radius_test.png'),
    );
  });

  testWidgets(
    'RadiusThemeData.main() Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();
      final widget = Builder(
        builder: (_) => Container(key: key),
      );

      await tester.pumpApp(widget);
      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.radius, equals(RadiusThemeData.main()));
    },
  );
}
