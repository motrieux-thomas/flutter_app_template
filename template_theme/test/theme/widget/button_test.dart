import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/template_theme_test_utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppButton.primary Should render', () {
    testWidgets('when disabled', (tester) async {
      final widget = Scaffold(
        body: AppButton.primary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: null,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/primary_disabled.png'),
      );
    });

    testWidgets('when expanded', (tester) async {
      final widget = Scaffold(
        body: AppButton.primary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: () {},
          isExpanded: true,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/primary_expanded.png'),
      );
    });

    testWidgets('with an icon', (tester) async {
      final widget = Scaffold(
        body: AppButton.primary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: () {},
          icon: Icons.book,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/primary_icon.png'),
      );
    });
  });

  group('AppButton.secondary Should render', () {
    testWidgets('when expanded', (tester) async {
      final widget = Scaffold(
        body: AppButton.secondary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: () {},
          isExpanded: true,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/secondary_expanded.png'),
      );
    });

    testWidgets('when loading', (tester) async {
      final widget = Scaffold(
        body: AppButton.secondary(
          key: UniqueKey(),
          label: "I'm a button",
          isLoading: true,
          onPressed: () {},
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/secondary_loading.png'),
      );
    });

    testWidgets('when disabled', (tester) async {
      final widget = Scaffold(
        body: AppButton.secondary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: null,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/secondary_disabled.png'),
      );
    });
  });

  group('AppButton.tertiary Should render', () {
    testWidgets('when expended', (tester) async {
      final widget = Scaffold(
        body: AppButton.tertiary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: () {},
          isExpanded: true,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/tertiary_expanded.png'),
      );
    });

    testWidgets('when disabled', (tester) async {
      final widget = Scaffold(
        body: AppButton.tertiary(
          key: UniqueKey(),
          label: "I'm a button",
          onPressed: null,
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(AppButton),
        matchesGoldenFileWithRules('button/tertiary_disabled.png'),
      );
    });
  });
}
