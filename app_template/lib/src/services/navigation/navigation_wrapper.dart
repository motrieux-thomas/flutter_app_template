import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app_template/src/services/navigation/bottom_navigation_bar.dart';
import 'package:app_template/src/services/navigation/navigation_paths.dart';

class NavigationBarItem {
  final AppPath path;
  final IconData icon;
  final String label;
  final IconData? selectedIcon;

  NavigationBarItem({
    required this.path,
    required this.icon,
    required this.label,
    this.selectedIcon,
  });

  /// Get the icon to display on the navbar.
  IconData getDestinationIcon(bool isCurrent) {
    return isCurrent ? selectedIcon ?? icon : icon;
  }
}

class NavigationWrapper extends ConsumerWidget {
  const NavigationWrapper({
    required this.currentLocation,
    required this.hasNavigationBar,
    required this.child,
    Key? key,
  }) : super(key: key);

  final String currentLocation;
  final bool hasNavigationBar;

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = AppLocalizations.of(context)!;

    // List of all destination that can be instanciated in the bottom bar.
    final destinations = [
      NavigationBarItem(
        path: Paths.homepage,
        icon: Icons.home,
        label: translations.navigationBarHomepageItem,
      ),
    ];

    onTap(NavigationBarItem item) => context.go(item.path.location);

    // We find the current index by looking the current location in the app router.
    int currentIndex = destinations.indexWhere(
      (dest) => currentLocation.contains(dest.path.location),
    );
    if (currentIndex == -1) currentIndex = 0;

    return Column(
      children: [
        Expanded(child: child),
        Material(
          key: ValueKey(currentLocation),
          child: BottomNavigation(
            items: destinations,
            currentIndex: currentIndex,
            onTap: (index) => onTap(destinations[index]),
          ),
        ),
      ],
    );
  }
}
