import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/widget/gap.dart';

import '../../helpers/pump_app.dart';

extension _PumpGap on WidgetTester {
  Future<void> pumpGap(Widget widget, {Key? key}) async {
    return pumpApp(
      Column(
        key: key,
        children: [
          Container(
            color: Colors.white,
            height: 10,
            width: 10,
          ),
          widget,
          Container(
            color: Colors.white,
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }
}

void main() {
  testWidgets('AppGap tiny', (tester) async {
    final key = UniqueKey();

    await tester.pumpGap(AppGap.tiny(key: UniqueKey()), key: key);

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('gap/tiny.png'),
    );
  });

  testWidgets('AppGap small', (tester) async {
    final key = UniqueKey();

    await tester.pumpGap(AppGap.small(key: UniqueKey()), key: key);

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('gap/small.png'),
    );
  });

  testWidgets('AppGap medium', (tester) async {
    final key = UniqueKey();

    await tester.pumpGap(AppGap.medium(key: UniqueKey()), key: key);

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('gap/medium.png'),
    );
  });

  testWidgets('AppGap big', (tester) async {
    final key = UniqueKey();

    await tester.pumpGap(AppGap.big(key: UniqueKey()), key: key);

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('gap/big.png'),
    );
  });

  testWidgets('AppGap huge', (tester) async {
    final key = UniqueKey();

    await tester.pumpGap(AppGap.huge(key: UniqueKey()), key: key);

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('gap/huge.png'),
    );
  });

  testWidgets('AppGap expanded', (tester) async {
    final key = UniqueKey();

    await tester.pumpGap(AppGap.expanded(key: UniqueKey()), key: key);

    await expectLater(
      find.byKey(key),
      matchesGoldenFileWithRules('gap/expanded.png'),
    );
  });
}
