// We don't care about testing cheat code...
// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/domains/cheat_code/logic/cheat_code_providers.dart';
import 'package:app_template/src/domains/cheat_code/view/widgets/cache_management.dart';
import 'package:template_theme/template_theme.dart';

import 'widgets/app_informations.dart';

class CheatCodeLayout extends ConsumerStatefulWidget {
  const CheatCodeLayout({Key? key}) : super(key: key);

  @override
  CheatCodeBottomSheetState createState() => CheatCodeBottomSheetState();
}

class CheatCodeBottomSheetState extends ConsumerState<CheatCodeLayout> {
  late Key key;

  @override
  initState() {
    super.initState();
    key = UniqueKey();
  }

  Widget _buildCustomDivider(BuildContext context) {
    return Padding(
      padding: Theme.of(context).insets.m.verticalOnly,
      child: AppLine(color: Theme.of(context).colors.backgroundSecondary),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    ref.listen(cheatCodeNotifierProvider, (_, __) {
      setState(() => key = UniqueKey());
    });

    return Scaffold(
      appBar: AppBar(
        title: const AppText.title('Developer options 👨‍💻'),
        backgroundColor: theme.colors.backgroundPrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: theme.insets.m.horizontalOnly,
          child: ListView(
            children: [
              const AppGap.medium(),
              const AppInformations(),
              _buildCustomDivider(context),
              const CacheManagement(),
            ],
          ),
        ),
      ),
    );
  }
}
