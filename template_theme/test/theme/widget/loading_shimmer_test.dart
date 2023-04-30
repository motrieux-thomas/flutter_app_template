import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/widget/loading_shimmer.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppLoadingShimmer Should render', () {
    testWidgets('with defined size', (tester) async {
      await tester.pumpApp(AppLoadingShimmer(height: 100, width: 100));

      await tester.pump();

      await expectLater(
        find.byType(AppLoadingShimmer),
        matchesGoldenFileWithRules('loading_shimmer/defined_size.png'),
      );
    });

    testWidgets('with expanded', (tester) async {
      await tester.pumpApp(
        Column(
          children: [
            AppLoadingShimmer.expanded(),
          ],
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppLoadingShimmer),
        matchesGoldenFileWithRules('loading_shimmer/expanded.png'),
      );
    });
  });
}
