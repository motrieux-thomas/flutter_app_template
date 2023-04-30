import 'package:flutter/material.dart';
import 'package:template_theme/theme/data/theme_data.dart';
import 'package:template_theme/theme/widget/tap.dart';
import 'package:template_theme/theme/widget/texts.dart';

const double _borderSize = 1;

class AppSelectableItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function()? onTap;

  const AppSelectableItem({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(theme.sizes.s);
    return AppTap(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(width: _borderSize, color: theme.colors.brandPrimary)
              : null,
          borderRadius: borderRadius,
          color: isSelected
              ? Colors.transparent
              : theme.colors.backgroundSecondary,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: theme.sizes.xs - (isSelected ? _borderSize : 0),
          vertical: theme.sizes.xxs - (isSelected ? _borderSize : 0),
        ),
        child: Center(
          child: AppText.p2(
            label,
            color: Theme.of(context).colors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
