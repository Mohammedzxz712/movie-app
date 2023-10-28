import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/navigate_model.dart';
import 'package:movie_app/modules/details/cubit/cubit.dart';
import 'package:movie_app/modules/details/cubit/states.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)?.settings.arguments as NavigateModel;
    return BlocProvider(
      create: (context) => DetailsCubit()
        ..getDetailsData(args.id)
        ..getSimilarData(args.id),
      child: BlocConsumer<DetailsCubit, DetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DetailsCubit.get(context);
          return ConditionalBuilder(
            builder: (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF1D1E1D),
                title: SizedBox(
                  width: 300.w,
                  height: 31.h,
                  child: Text(
                    '${cubit.detailsModel?.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${cubit.detailsModel?.backdropPath}"),
                          fit: BoxFit.cover,
                          height: 217.h,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 79.h,
                          left: 176.w,
                          right: 176.w,
                          child: Image(
                            image: AssetImage("assets/images/iconPlay.png"),
                            //fit: BoxFit.cover,
                            height: 60.h,
                            width: 60.w,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 13.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cubit.detailsModel?.title}",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "${cubit.detailsModel?.releaseDate}",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color(0xFFB5B4B4),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Image(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500${cubit.detailsModel?.backdropPath}"),
                                            fit: BoxFit.cover,
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
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 65.w,
                                              height: 25.h,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFF514F4F)),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${cubit.detailsModel?.genres?[0].name}",
                                                  style: TextStyle(
                                                    color: Color(0xFFCBCBCB),
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                "${cubit.detailsModel?.overview}",
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Color(0xFFCBCBCB),
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFFBB3B),
                                                ),
                                                SizedBox(
                                                  width: 7.w,
                                                ),
                                                Text(
                                                  "${cubit.detailsModel?.voteAverage.toString().substring(0, 3)}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                              ]),
                        ),
                        Container(
                          height: 255.h,
                          width: double.infinity,
                          color: Color(0xff282A28),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 12.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'More Like This',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4),
                                                      topRight:
                                                          Radius.circular(4),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          "https://image.tmdb.org/t/p/w500${cubit.similarModel?.results?[index].backdropPath}",
                                                      fit: BoxFit.cover,
                                                      height: 127.74.h,
                                                      width: 96.87.w,
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                        color: Colors.yellow,
                                                      )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
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
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5.h,
                                                    bottom: 5.h,
                                                    left: 5.w),
                                                height: 65.h,
                                                width: 96.w,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF343534),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          4),
                                                              bottomLeft: Radius
                                                                  .circular(
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
                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                              Color(0xffFFBB3B),
                                                          size: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                          "${cubit.similarModel?.results?[index].voteAverage.toString().substring(0, 3)}",
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "${cubit.similarModel?.results?[index].title}",
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                    Text(
                                                      "${cubit.similarModel?.results?[index].releaseDate}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 8.sp,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 10,
                                          ),
                                      itemCount: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            condition: cubit.detailsModel != null && cubit.similarModel != null,
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
          );
        },
      ),
    );
  }
}
