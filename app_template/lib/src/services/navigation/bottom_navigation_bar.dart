import 'package:flutter/material.dart';
import 'package:app_template/src/services/navigation/navigation_wrapper.dart';
import 'package:template_theme/template_theme.dart';

const kBottomBarHeight = 50.0;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final List<NavigationBarItem> items;
  final int currentIndex;

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colors.backgroundPrimary,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Padding(
            padding: theme.insets.xl.horizontalOnly + theme.insets.m.topOnly,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.map<Widget>((item) {
                final itemIndex = items.indexOf(item);
                final isCurrent = itemIndex == currentIndex;

                final Color color = itemIndex == currentIndex
                    ? theme.colors.brandPrimary
                    : theme.colors.textSecondary;

                final IconData icon =
                    isCurrent ? (item.selectedIcon ?? item.icon) : item.icon;

                return Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => onTap(itemIndex),
                        // We add a transparent container to increase the hitbox of the onClick.
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIcon.regular(icon, color: color),
                              const AppGap.tiny(),
                              AppText.caption(
                                item.label.toUpperCase(),
                                fontWeight: FontWeight.w700,
                                color: color,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
