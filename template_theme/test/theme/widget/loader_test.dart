import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/theme/widget/loader.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppLoader Should render', () {
    testWidgets('default', (tester) async {
      await tester.pumpApp(const AppLoader());
      expect(find.byType(AppLoader), findsOneWidget);
    });

    testWidgets('small', (tester) async {
      await tester.pumpApp(const AppLoader());
      expect(find.byType(AppLoader), findsOneWidget);
    });

    testWidgets('regular', (tester) async {
      await tester.pumpApp(const AppLoader());
      expect(find.byType(AppLoader), findsOneWidget);
    });

    testWidgets('big', (tester) async {
      await tester.pumpApp(const AppLoader());
      expect(find.byType(AppLoader), findsOneWidget);
    });
  });
}
