// We don't care about testing cheat code...
// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/services/local_repo/local_repo_providers.dart';
import 'package:template_theme/template_theme.dart';

class CacheManagement extends ConsumerWidget {
  const CacheManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localAuthenticationApi = ref.read(localAuthenticationApiProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppText.smallTitle('💾 Local cache management'),
        const AppGap.small(),
        AppButton.secondary(
          label: 'Delete raw token',
          icon: Icons.refresh,
          onPressed: () {
            localAuthenticationApi.deleteRawToken();
          },
        ),
      ],
    );
  }
}
