import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/models/navigate_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/HomeModel.dart';
import '../details/details_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return ConditionalBuilder(
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 313.h,
                            child: PageView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  pageItem(cubit.homeModel?.results[index]),
                              itemCount: 3,
                              controller: boardController,
                              onPageChanged: (int index) {},
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: boardController,
                            count: 3,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Colors.orange,
                              dotColor: Colors.grey,
                              dotHeight: 11,
                              dotWidth: 11,
                              expansionFactor: 3,
                              spacing: 5,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 187.h,
                    width: double.infinity,
                    color: Color(0xFF282A28),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Release',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      DetailsScreen.routeName,
                                      arguments: NavigateModel(cubit
                                          .releaseModel?.results?[index]?.id),
                                    );
                                    cubit.getDetailsData(cubit
                                        .releaseModel?.results?[index]?.id);
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image(
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500${cubit.releaseModel?.results?[index].backdropPath}",
                                          ),
                                          fit: BoxFit.cover,
                                          height: 127.74.h,
                                          width: 96.87.w,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          addToWatchlist(
                                            cubit.releaseModel?.results?[index]
                                                    ?.title ??
                                                '',
                                            cubit.releaseModel?.results?[index]
                                                    ?.overview ??
                                                '',
                                            "https://image.tmdb.org/t/p/w500${cubit.releaseModel?.results?[index]?.backdropPath}",
                                            cubit.releaseModel?.results?[index]
                                                    ?.releaseDate ??
                                                '',
                                          );
                                          AlertDialog(actions: [
                                            Text('Item added to watchlist '),
                                          ]);
                                        },
                                        child: Icon(
                                          Icons.bookmark_add_rounded,
                                          color: Color(0xff514F4F),
                                          size: 38.r,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              itemCount: cubit.releaseModel?.results?.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 285.h,
                    width: double.infinity,
                    color: Color(0xff282A28),
                    child: Padding(
                      padding: EdgeInsets.only(left: 21.w, top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recomended',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.routeName,
                                            arguments: NavigateModel(cubit
                                                .recommendedModel
                                                ?.results?[index]
                                                ?.id));
                                        cubit.getDetailsData(cubit
                                            .releaseModel?.results?[index]?.id);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4),
                                                  topRight: Radius.circular(4),
                                                ),
                                                child: Image(
                                                  image: NetworkImage(
                                                      "https://image.tmdb.org/t/p/w500${cubit.recommendedModel?.results?[index].backdropPath}"),
                                                  fit: BoxFit.cover,
                                                  height: 127.74.h,
                                                  width: 96.87.w,
                                                ),
                                              ),
                                              Positioned(
                                                top: -5.h,
                                                left: -7.5.w,
                                                child: Icon(
                                                  Icons.bookmark,
                                                  color: Color(0xff514F4F),
                                                  size: 38.r,
                                                ),
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20.h,
                                              )
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 5.h,
                                                bottom: 5.h,
                                                left: 5.w),
                                            height: 90.h,
                                            width: 96.w,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF343534),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4))),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x29000000),
                                                  blurRadius: 3,
                                                  offset: Offset(0, 3),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Color(0xffFFBB3B),
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 4.w,
                                                    ),
                                                    Text(
                                                      '${cubit.recommendedModel?.results?[index].voteAverage?.toStringAsFixed(1)}',
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  '${cubit.recommendedModel?.results?[index].title}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  '${cubit.recommendedModel?.results?[index].releaseDate}',
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 14.w,
                                    ),
                                itemCount: cubit.recommendedModel == null
                                    ? 10
                                    : cubit.recommendedModel!.results!.length),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          ),
          condition: cubit.homeModel != null,
        );
      },
    );
  }

  Widget pageItem(Results? results) => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${results?.backdropPath}"),
              fit: BoxFit.cover,
              height: 217,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 90.h,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 26.w),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${results?.posterPath}"),
                          //fit: BoxFit.cover,
                          height: 199.h,
                          width: 129.w,
                        ),
                      ),
                      Positioned(
                        top: -5.h,
                        left: -8.w,
                        child: Icon(
                          Icons.bookmark,
                          color: Color(0xff514F4F),
                          size: 38.h,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.h,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/images/iconPlay.png"),
                      //fit: BoxFit.cover,
                      height: 60.h,
                      width: 60.w,
                    ),
                    SizedBox(
                      height: 92.h,
                    ),
                    Text(
                      "${results?.title}",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${results?.releaseDate}",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );

  void addToWatchlist(
      String title, String description, String imageUrl, String date) {
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
