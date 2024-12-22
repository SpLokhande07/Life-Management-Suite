import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/core/widget/adaptive_scaffold/home_scaffold/home_scaffold.dart';
import 'package:taskflow/feature/calendar/view/calendar_view.dart';
import 'package:taskflow/feature/goals/view/goals_view.dart';
import 'package:taskflow/feature/home/provider/home_bottom_nav_provider.dart';
import 'package:taskflow/feature/profile/view/profile_view.dart';

import '../../widget_view_model/app_nav_bar_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<AppNavBarViewModel> list = [
    AppNavBarViewModel(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: "Home",
      view: HomeView(),
    ),
    AppNavBarViewModel(
      icon: Icon(Icons.calendar_month),
      activeIcon: Icon(Icons.calendar_month),
      label: "Calendar",
      view: CalendarView(),
    ),
    AppNavBarViewModel(
        icon: Icon(
          Icons.check,
        ),
        activeIcon: Icon(
          Icons.check,
        ),
        label: "Goals",
        view: GoalsView()),
    AppNavBarViewModel(
        icon: Icon(
          Icons.attach_money,
        ),
        activeIcon: Icon(
          Icons.attach_money,
        ),
        label: "Finance",
        view: GoalsView()),
    AppNavBarViewModel(
        icon: Icon(
          Icons.location_on,
        ),
        activeIcon: Icon(
          Icons.location_on,
        ),
        label: "Social",
        view: GoalsView()),
    AppNavBarViewModel(
        icon: Icon(
          Icons.account_circle,
        ),
        activeIcon: Icon(Icons.account_circle),
        label: "Profile",
        view: ProfileView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var bottomNavIndex = ref.watch(homeNavBarProvider);
      var bottomNavUpdateIndex = ref.watch(homeNavBarProvider.notifier);
      return HomeScaffold(
        mobileBody: _mobileView(),
        tabletBody: _tabletView(),
        webBody: _webView(),
        mobileBottomNavigationBarItems: list.map((e) {
          AppNavBarViewModel model = e;
          return model.toBottomNavItem(e);
        }).toList(),
        selectedIndex: bottomNavIndex,
        tabletNavigationRailDestinations: list.map((e) {
          AppNavBarViewModel model = e;
          return model.toNavigationRailDestination(e);
        }).toList(),
        onBottomNavChanged: (int val) => bottomNavUpdateIndex.setIndex(val),
      );
    });
  }

  Widget _mobileView() {
    return Placeholder();
  }

  Widget _tabletView() {
    return Placeholder();
  }

  Widget _webView() {
    return Placeholder();
  }
}
