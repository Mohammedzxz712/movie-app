import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import '../../shared/components/constant.dart';
import '../../shared/network/remote/dio_helper.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(Initial());
  void removeFromWatchlist(int id) {
    FirebaseFirestore.instance
        .collection('watchlist')
        .where('id', isEqualTo: id)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.first.reference.delete().then((value) {
          Fluttertoast.showToast(
            msg: "Item removed from watchlist",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[800],
            textColor: Colors.white,
            fontSize: 16.0,
          );
          print('Item removed from watchlist');
        }).catchError((error) {
          print('Error removing item from watchlist: $error');
        });
      } else {
        print('Movie with id $id not found in the watchlist');
      }
    });
  }

  static LayoutCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomsNavBar = [
    BottomNavigationBarItem(
      activeIcon: Image.asset(
        'assets/images/home_icon_active.png',
        width: 25.45.w,
        height: 20.25.h,
      ),
      icon: Image.asset(
        'assets/images/home_icon.png',
        width: 25.45.w,
        height: 20.25.h,
      ),
      label: "HOME",
    ),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/search_active.png',
          width: 19.55.w,
          height: 20.25.h,
        ),
        icon: Image.asset(
          'assets/images/search.png',
          width: 19.55.w,
          height: 20.25.h,
        ),
        label: "SEARCH"),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          'assets/images/icon_movie_active.svg',
          width: 26.13.w,
          height: 21.25.h,
        ),
        icon: SvgPicture.asset(
          'assets/images/icon_movie.svg',
          width: 26.13.w,
          height: 21.25.h,
        ),
        label: "BROWSE"),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          'assets/images/Icon_bookmarks_active.svg',
          width: 22.16.w,
          height: 22.16.h,
        ),
        icon: SvgPicture.asset(
          'assets/images/Icon_bookmarks.svg',
          width: 22.16.w,
          height: 22.16.h,
        ),
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
    DioHelper.getData(url: POPULAR, query: {
      'page': 1,
      'api_key': APIKEY,
    }).then((value) {
      homeModel = HomeModel.fromJson(value!.data);

      emit(GetHomeDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeDataError());
    });
  }

  ReleaseModel? releaseModel;

  void getReleaseData() {
    emit(GetLoadReleaseData());
    DioHelper.getData(url: UPCOMING, query: {
      'page': 1,
      'api_key': APIKEY,
    }).then((value) {
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
    DioHelper.getData(url: TOPRATED, query: {
      'page': 1,
      'api_key': APIKEY,
    }).then((value) {
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
    DioHelper.getData(url: "movie/$id", query: {
      'page': 1,
      'api_key': APIKEY,
    }).then((value) {
      detailsModel = DetailsModel.fromJson(value!.data);
      emit(GetDetailsDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetLoadDetailsData());
    });
  }

  void addToWatchlist(
      String title, String description, String imageUrl, String date,bool isFavourite,num id) {
    FirebaseFirestore.instance
        .collection('watchlist')
        .where('title', isEqualTo: title)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        FirebaseFirestore.instance.collection('watchlist').add({
          'title': title,
          'description': description,
          'imageUrl': imageUrl,
          'date': date,
          'isFavourite':isFavourite,
          'id':id
        }).then((value) {
          Fluttertoast.showToast(
            msg: "Item added to watchlist",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[800],
            textColor: Colors.white,
            fontSize: 16.0,
          );
          print('Item added to watchlist');
        }).catchError((error) {
          print('Error adding item to watchlist: $error');
        });
      } else {
        print('Movie with the same title already exists in the watchlist');
      }
    });
  }
}
