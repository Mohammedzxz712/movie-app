import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit/states.dart';
import '../../modules/browse/browse_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/search/search_screen.dart';
import '../../modules/watch_list/watch_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(Initial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomsNavBar = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.open_in_browser), label: "BROWSE"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.screen_search_desktop), label: "WATCHLIST"),
  ];
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchScreen(),
  ];

  void changeBottomScreen(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNav());
  }
}
