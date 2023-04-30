import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/template_theme.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('AppTap', (tester) async {
    bool tapped = false;

    final widget = AppTap(
      fit: BoxFit.none,
      child: const SizedBox(height: 20, width: 20),
      onTap: () => tapped = true,
    );
    await tester.pumpApp(widget);

    await tester.tap(find.byType(AppTap));

    expect(tapped, isTrue);
  });
}
