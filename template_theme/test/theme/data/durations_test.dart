import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/theme/data/durations.dart';
import 'package:template_theme/template_theme.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('DurationsThemeData Should extends Equatable', (tester) async {
    final durations1 = DurationsThemeData.main();
    const durations2 = DurationsThemeData(
      fast: Duration(milliseconds: 100),
      regular: Duration(milliseconds: 350),
      long: Duration(milliseconds: 500),
    );

    expect(durations1 == durations2, false);
  });

  testWidgets(
    'DurationsThemeData.main() Should be available from the theme (ThemeExtension)',
    (tester) async {
      final UniqueKey key = UniqueKey();
      final widget = Builder(
        builder: (_) => Container(key: key),
      );

      await tester.pumpApp(widget);
      ThemeData theme = Theme.of(tester.element(find.byKey(key)));

      expect(theme.durations, equals(DurationsThemeData.main()));
    },
  );
}
