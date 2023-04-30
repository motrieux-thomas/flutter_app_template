// We don't care about testing cheat code...
// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/feature_toggle.dart';
import 'package:app_template/src/domains/cheat_code/logic/cheat_code_providers.dart';

class CheatCodeInitializer extends ConsumerWidget {
  const CheatCodeInitializer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(isCheatCodeEnabledProvider)) return child;

    final cheatCodeNotifier = ref.watch(cheatCodeNotifierProvider);

    final overrides = cheatCodeNotifier.generateOverrides();
    if (overrides.isEmpty) {
      return child;
    } else {
      return Builder(
        key: UniqueKey(),
        builder: (_) {
          return ProviderScope(overrides: overrides, child: child);
        },
      );
    }
  }
}
