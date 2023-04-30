import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/feature_toggle.dart';
import 'package:app_template/src/domains/authentication/logic/authentication_providers.dart';
import 'package:app_template/src/domains/cheat_code/view/widgets/external/cheat_code_access_button.dart';
import 'package:template_theme/template_theme.dart';

class HomepageLayout extends ConsumerWidget {
  const HomepageLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // coverage:ignore-start
    final hasCheatCodeEnabled = ref.watch(isCheatCodeEnabledProvider);
    // coverage:ignore-end

    return Scaffold(
      body: Padding(
        padding: theme.insets.m.horizontalOnly,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppGap.expanded(),
            FlutterLogo(size: theme.sizes.m),
            const AppGap.small(),
            const Text('Homepage'),
            const AppGap.expanded(),
            // coverage:ignore-start
            if (hasCheatCodeEnabled)
              Padding(
                padding: theme.insets.m.verticalOnly,
                child: const CheatCodeAccessButton(),
              ),
            // coverage:ignore-end
            AppButton.primary(
              label: 'Logout',
              isExpanded: true,
              onPressed: () {
                ref.watch(loginNotifierProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
