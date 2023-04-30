import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/data/colors.dart';
import 'package:template_theme/template_theme.dart';

import '../../helpers/pump_app.dart';

extension PumpColorsGrid on WidgetTester {
  Future<void> pumpColorsGrid(ColorsThemeData colorsData) async {
    final colorsBox = colorsData.props.map((prop) {
      if (prop is Color) return Container(color: prop);
      if (prop is LinearGradient) {
        return Container(decoration: BoxDecoration(gradient: prop));
      }
      return Container();
    });

    await pumpWidget(
      MaterialApp(
        home: Center(
          child: GridView.count(
            crossAxisCount: 7,
            children: colorsBox.toList(),
          ),
        ),
      ),
    );

    await pumpAndSettle();
  }
}

void main() {
  testWidgets('ColorsThemeData Should render light colors', (tester) async {
    await tester.pumpColorsGrid(ColorsThemeData.light());
    await expectLater(
      find.byType(GridView),
      matchesGoldenFileWithRules('colors/light_grid.png'),
    );
  });

  testWidgets('ColorsThemeData Should render dark colors', (tester) async {
    await tester.pumpColorsGrid(ColorsThemeData.dark());
    await expectLater(
      find.byType(GridView),
      matchesGoldenFileWithRules('colors/dark_grid.png'),
    );
  });

  testWidgets(
    'ColorsThemeData Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();
      final widget = Builder(
        builder: (_) => Container(key: key),
      );

      await tester.pumpApp(widget);
      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.colors, equals(ColorsThemeData.light()));
    },
  );
}
