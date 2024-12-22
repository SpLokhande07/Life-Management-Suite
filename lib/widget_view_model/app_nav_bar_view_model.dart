import 'package:flutter/material.dart';
import 'package:taskflow/widget/text/app_text.dart';

class AppNavBarViewModel {
  Widget icon;
  Widget activeIcon;
  String label;
  Widget view;

  AppNavBarViewModel({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.view,
  });

  BottomNavigationBarItem toBottomNavItem(AppNavBarViewModel model) {
    return BottomNavigationBarItem(
      icon: model.icon,
      label: model.label,
      activeIcon: model.activeIcon,
    );
  }

  NavigationRailDestination toNavigationRailDestination(
      AppNavBarViewModel model) {
    return NavigationRailDestination(
      icon: model.icon,
      label: AppText(text: model.label),
      selectedIcon: model.activeIcon,
    );
  }
}
