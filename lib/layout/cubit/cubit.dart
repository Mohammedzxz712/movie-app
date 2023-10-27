import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/layout/cubit/states.dart';
import '../../modules/browse/browse_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/search/search_screen.dart';
import '../../modules/watch_list/watch_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(Initial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomsNavBar = [
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/home_icon_active.png',
          scale: 3.5,
        ),
        icon: Image.asset(
          'assets/images/home_icon.png',
          scale: 3.5,
        ),
        label: "HOME",),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/search_active.png',
          scale: 3.5,
        ),
        icon: Image.asset(
          'assets/images/search.png',
          scale: 3.5,
        ),
        label: "SEARCH"),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('assets/images/icon_movie_active.svg'),
        icon: SvgPicture.asset('assets/images/icon_movie.svg'),
        label: "BROWSE"),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('assets/images/Icon_bookmarks_active.svg'),
        icon: SvgPicture.asset('assets/images/Icon_bookmarks.svg'),
        label: "WATCHLIST"),
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
