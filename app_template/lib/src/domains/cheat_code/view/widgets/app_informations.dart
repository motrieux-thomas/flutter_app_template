import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/services/environment/environment_providers.dart';
import 'package:template_theme/template_theme.dart';

// We don't care about testing cheat code...
// coverage:ignore-file

class AppInformations extends ConsumerWidget {
  const AppInformations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final appVersion = ref.watch(versionProvider).asData?.value;
    final appId = ref.watch(appIdProvider).asData?.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppText.smallTitle('ℹ️ Informations'),
        const AppGap.small(),
        _AppInformationLine(
          title: 'App ID',
          value: appId.toString(),
        ),
        const AppGap.small(),
        _AppInformationLine(
          title: 'App version',
          value: appVersion.toString(),
        ),
      ],
    );
  }
}

class _AppInformationLine extends StatelessWidget {
  const _AppInformationLine({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.p2('$title : '),
        const AppGap.tiny(),
        Expanded(child: AppText.p2(value))
      ],
    );
  }
}
