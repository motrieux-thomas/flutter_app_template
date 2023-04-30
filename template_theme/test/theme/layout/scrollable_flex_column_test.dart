import 'package:flutter/material.dart';
import 'package:template_theme/template_theme_test_utils.dart';
import 'package:template_theme/theme/layout/scrollable_flex_column.dart';

void main() {
  testResponsiveWidgets('ScrollableFlexColumn Should render', (
    tester,
    variant,
  ) async {
    const spacers = [Spacer(), SizedBox(height: 16)];

    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        color: Colors.black,
        height: 100,
      ),
    );

    final widget = MaterialApp(
      home: Scaffold(
        body: ScrollableFlexColumn(
          children: [
            ...spacers,
            content,
            ...spacers,
            content,
            ...spacers,
            content,
            ...spacers,
            content,
            ...spacers,
            content,
            ...spacers,
            content,
            ...spacers,
          ],
        ),
      ),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    await tester.expectGolden<Scaffold>(variant.currentValue!);
  });
}
