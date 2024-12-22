import 'package:flutter/material.dart';

import '../../../../data/tf_widget.dart';

class HomeScaffold extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget webBody;
  final int selectedIndex;
  final Function(int) onBottomNavChanged;
  final List<BottomNavigationBarItem> mobileBottomNavigationBarItems;
  final List<NavigationRailDestination> tabletNavigationRailDestinations;

  const HomeScaffold({
    Key? key,
    required this.mobileBody,
    required this.tabletBody,
    required this.webBody,
    required this.selectedIndex,
    required this.mobileBottomNavigationBarItems,
    required this.tabletNavigationRailDestinations,
    required this.onBottomNavChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // if (width < 600) {
    return Scaffold(
      body: Row(
        children: [
          if (width > 600)
            NavigationRail(
              onDestinationSelected: onBottomNavChanged,
              destinations: tabletNavigationRailDestinations,
              selectedIndex: selectedIndex,
            ),
          Expanded(
            child: AdaptiveWidget(
                small: mobileBody, medium: tabletBody, large: webBody),
          ),
        ],
      ),
      bottomNavigationBar: width < 600
          ? BottomNavigationBar(
              iconSize: 32,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: onBottomNavChanged,
              items: mobileBottomNavigationBarItems,
              // backgroundColor: Colors.black,
            )
          : null,
    );
    // }
    // else if (width < 1200) {
    //   return Scaffold(
    //     body: Row(
    //       children: [
    //         NavigationRail(
    //           destinations: tabletNavigationRailDestinations,
    //           selectedIndex: selectedIndex,
    //         ),
    //         Expanded(
    //           child: tabletBody,
    //         ),
    //       ],
    //     ),
    //   );
    // } else {
    //   return Scaffold(
    //     body: webBody,
    //   );
    // }
  }
}
