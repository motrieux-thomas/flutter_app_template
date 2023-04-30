import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/theme/layout/splash_icon.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('AppSplashIcon can render', (tester) async {
    const widget = AppSplashIcon();
    await tester.pumpApp(widget);
    expect(find.byType(AppSplashIcon), findsOneWidget);
  });
}
