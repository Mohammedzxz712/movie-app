import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../models/RecommendedModel.dart';
import '../../../models/navigate_model.dart';
import '../../details/details_screen.dart';

Widget recommendedItem(List<ResultsRecommended>? results, context) => Container(
  height: 285.h,
  width: double.infinity,
  color: const Color(0xff282A28),
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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: NavigateModel(results?[index].id));
                  LayoutCubit.get(context)
                      .getDetailsData(results?[index].id);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          child: Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${results?[index].backdropPath}"),
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
                            color: const Color(0xff514F4F),
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
                          top: 5.h, bottom: 5.h, left: 5.w),
                      height: 90.h,
                      width: 96.w,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF343534),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(4),
                                bottomLeft: Radius.circular(4))),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                '${results?[index].voteAverage?.toStringAsFixed(1)}',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Text(
                            '${results?[index].title}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 10.sp, color: Colors.white),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            '${results?[index].releaseDate}',
                            style: TextStyle(
                                fontSize: 8.sp, color: Colors.grey),
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
              itemCount: LayoutCubit.get(context).recommendedModel == null
                  ? 10
                  : LayoutCubit.get(context)
                  .recommendedModel!
                  .results!
                  .length),
        )
      ],
    ),
  ),
);