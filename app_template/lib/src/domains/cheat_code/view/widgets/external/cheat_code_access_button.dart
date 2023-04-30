import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/src/services/navigation/navigation_paths.dart';
import 'package:template_theme/template_theme.dart';

class CheatCodeAccessButton extends StatelessWidget {
  const CheatCodeAccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton.primary(
      label: 'Developer options',
      icon: Icons.code,
      isExpanded: true,
      onPressed: () => GoRouter.of(context).push(Paths.cheatCode.location),
    );
  }
}
