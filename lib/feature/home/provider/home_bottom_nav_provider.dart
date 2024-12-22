import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeNavBarProvider =
    StateNotifierProvider<HomeViewNavBarProvider, int>((ref) {
  return HomeViewNavBarProvider();
});

class HomeViewNavBarProvider extends StateNotifier<int> {
  HomeViewNavBarProvider() : super(0);

  void setIndex(int value) {
    state = value;
  }
}
