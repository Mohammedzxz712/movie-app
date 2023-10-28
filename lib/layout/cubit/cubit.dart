import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/models/DetailsModel.dart';
import 'package:movie_app/models/HomeModel.dart';
import 'package:movie_app/models/RealeaseModel.dart';
import 'package:movie_app/models/RecommendedModel.dart';
import 'package:movie_app/shared/network/remote/end_points.dart';
import '../../modules/browse/browse_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/search/search_screen.dart';
import '../../modules/watch_list/watch_screen.dart';
import '../../shared/network/remote/dio_helper.dart';

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
      label: "HOME",
    ),
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

  HomeModel? homeModel;
  void getHomeData() {
    emit(GetLoadHomeData());
    DioHelper.getData(
            url: POPULAR,
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      print(homeModel?.results);
      emit(GetHomeDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeDataError());
    });
  }

  ReleaseModel? releaseModel;
  void getReleaseData() {
    emit(GetLoadReleaseData());
    DioHelper.getData(
            url: UPCOMING,
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      releaseModel = ReleaseModel.fromJson(value!.data);
      emit(GetReleaseDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetReleaseDataError());
    });
  }

  RecommendedModel? recommendedModel;
  void getRecommendData() {
    emit(GetLoadRecommendData());
    DioHelper.getData(
            url: TOPRATED,
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      recommendedModel = RecommendedModel.fromJson(value!.data);
      emit(GetRecommendDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetLoadRecommendData());
    });
  }

  DetailsModel? detailsModel;
  void getDetailsData(num? id) {
    emit(GetLoadDetailsData());
    DioHelper.getData(
            url: "movie/$id",
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      print(value.toString());
      detailsModel = DetailsModel.fromJson(value!.data);
      emit(GetDetailsDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetLoadDetailsData());
    });
  }
}
