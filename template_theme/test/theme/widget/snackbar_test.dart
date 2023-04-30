import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/widget/snackbar.dart';
import 'package:stateful/stateful.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppSnackBar Should render', () {
    testWidgets('Error', (tester) async {
      final widget = Scaffold(
        body: Initializer(
          initialize: (context) async {
            const message = SnackBarData(
              title: 'An error as occured',
              actionLabel: 'Retry',
              description: 'Please try again after ckecking your connection',
            );
            AppSnackBar.showError(
              context,
              message: message,
              ctaCallBack: () async {},
            );
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpApp(widget);

      await tester.pumpAndSettle();

      expect(
        find.byType(Scaffold),
        matchesGoldenFileWithRules('snack_bar/error.png'),
      );
    });

    testWidgets('Warning', (tester) async {
      final widget = Scaffold(
        body: Initializer(
          initialize: (context) async {
            const message = SnackBarData(
              title: 'Be careful',
              actionLabel: 'Retry',
              description: 'Someting went wrong',
            );
            AppSnackBar.showWarning(
              context,
              message: message,
              ctaCallBack: () async {},
            );
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpApp(widget);

      await tester.pumpAndSettle();

      expect(
        find.byType(Scaffold),
        matchesGoldenFileWithRules('snack_bar/warning.png'),
      );
    });

    testWidgets('Succces', (tester) async {
      final widget = Scaffold(
        body: Initializer(
          initialize: (context) async {
            const message = SnackBarData(
              title: 'Super',
              description: 'Every things worked out well',
            );
            AppSnackBar.showSuccess(context, message: message);
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpApp(widget);

      await tester.pumpAndSettle();

      expect(
        find.byType(Scaffold),
        matchesGoldenFileWithRules('snack_bar/success.png'),
      );
    });

    testWidgets('Info', (tester) async {
      final widget = Scaffold(
        body: Initializer(
          initialize: (context) async {
            const message = SnackBarData(
              title: null,
              description: 'Some random news',
            );
            AppSnackBar.showInfo(context, message: message);
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpApp(widget);

      await tester.pumpAndSettle();

      expect(
        find.byType(Scaffold),
        matchesGoldenFileWithRules('snack_bar/info.png'),
      );
    });
  });
}
