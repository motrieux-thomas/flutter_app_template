import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/data/sizes.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('SizesThemeData.phone() sizes', (tester) async {
    final phoneSizes = SizesThemeData.phone();

    final phoneSizesBox = phoneSizes.props.map((size) {
      return Container(
        height: size as double,
        width: size,
        color: Colors.white,
      );
    }).toList();

    final key = UniqueKey();
    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          key: key,
          children: [...phoneSizesBox],
        ),
      ),
    );

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('sizes/sizes_phone_test.png'),
    );
  });

  testWidgets(
    'SizesThemeData.phone() Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();

      final widget = Builder(builder: (_) => Container(key: key));
      await tester.pumpApp(widget);

      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.sizes, equals(SizesThemeData.phone()));
    },
  );
}
