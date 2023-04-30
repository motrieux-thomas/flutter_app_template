import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppLine', () {
    testWidgets('Should render horizontal', (tester) async {
      final widget = Scaffold(
        body: Center(
          child: AppLine(
            key: UniqueKey(),
            color: Colors.red,
            breadth: 5,
          ),
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFileWithRules('line/horizontal.png'),
      );
    });

    testWidgets('Should render vertical', (tester) async {
      final widget = Scaffold(
        body: Center(
          child: AppLine(
            key: UniqueKey(),
            color: Colors.red,
            breadth: 5,
            isHorizontal: false,
          ),
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFileWithRules('line/vertical.png'),
      );
    });
  });
}
