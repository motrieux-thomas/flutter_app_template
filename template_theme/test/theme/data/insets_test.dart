import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/data/insets.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('InsetsThemeData Should render insets', (tester) async {
    final insets = InsetsThemeData.phone();

    final paddingBox = insets.props.map((inset) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 144,
          height: 144,
          padding: inset,
          decoration: BoxDecoration(border: Border.all()),
          child: Container(color: Colors.black),
        ),
      );
    }).toList();

    await tester.pumpWidget(
      MaterialApp(
        color: Colors.white,
        home: Scaffold(
          body: Wrap(
            children: [...paddingBox],
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFileWithRules('insets/insets_test.png'),
    );
  });

  testWidgets(
    'InsetsThemeData.phone() Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();
      final widget = Builder(builder: (_) => Container(key: key));

      await tester.pumpApp(widget);
      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.insets, equals(InsetsThemeData.phone()));
    },
  );
}
