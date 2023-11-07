import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/SimilarModel.dart';

Widget moreLinkThisItem(List<ResultsSimilar>? results, context) => Container(
  height: 255.h,
  width: double.infinity,
  color: const Color(0xff282A28),
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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://image.tmdb.org/t/p/w500${results?[index].backdropPath}",
                          fit: BoxFit.cover,
                          height: 127.74.h,
                          width: 96.87.w,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.yellow,
                              )),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        top: -5.h,
                        left: -8.w,
                        child: Icon(
                          Icons.bookmark,
                          color: const Color(0xff514F4F),
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
                        top: 5.h, bottom: 5.h, left: 5.w),
                    height: 65.h,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "${results?[index].voteAverage.toString().substring(0, 3)}",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          "${results?[index].title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 10.sp, color: Colors.white),
                        ),
                        Text(
                          "${results?[index].releaseDate}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 8.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: 10),
        ),
      ],
    ),
  ),
);