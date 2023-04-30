import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/widget/texts.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppText Should render', () {
    testWidgets('title', (tester) async {
      await tester.pumpApp(
        Container(
          color: Colors.white,
          child: const AppText.title("👋 Nice to meet you, I'm a title."),
        ),
      );

      await expectLater(
        find.byType(AppText),
        matchesGoldenFileWithRules('text/title.png'),
      );
    });

    testWidgets('smallTitle', (tester) async {
      await tester.pumpApp(
        Container(
          color: Colors.white,
          child: const AppText.smallTitle(
            "👋 Nice to meet you, I'm a small title.",
          ),
        ),
      );

      await expectLater(
        find.byType(AppText),
        matchesGoldenFileWithRules('text/small_title.png'),
      );
    });

    testWidgets('p1', (tester) async {
      await tester.pumpApp(
        Container(
          color: Colors.white,
          child: const AppText.p1("👋 Nice to meet you, I'm a p1."),
        ),
      );

      await expectLater(
        find.byType(AppText),
        matchesGoldenFileWithRules('text/p1.png'),
      );
    });

    testWidgets('p2', (tester) async {
      await tester.pumpApp(
        Container(
          color: Colors.white,
          child: const AppText.p2("👋 Nice to meet you, I'm a p2."),
        ),
      );

      await expectLater(
        find.byType(AppText),
        matchesGoldenFileWithRules('text/p2.png'),
      );
    });

    testWidgets('button', (tester) async {
      await tester.pumpApp(
        Container(
          color: Colors.white,
          child: const AppText.button(
            "👋 Nice to meet you, I'm a button text.",
          ),
        ),
      );

      await expectLater(
        find.byType(AppText),
        matchesGoldenFileWithRules('text/button.png'),
      );
    });
  });
}
