import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/DetailsModel.dart';

Widget miniPhotoAndDescriptionItemInDetails(
        DetailsModel? detailsModel, context) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "${detailsModel?.title}",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "${detailsModel?.releaseDate}",
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
                  borderRadius: BorderRadius.circular(4),
                  child: Image(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${detailsModel?.backdropPath}"),
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
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65.w,
                      height: 25.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF514F4F)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${detailsModel?.genres?[0].name}",
                          style: TextStyle(
                            color: const Color(0xFFCBCBCB),
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
                        "${detailsModel?.overview}",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFFCBCBCB),
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
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFBB3B),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "${detailsModel?.voteAverage.toString().substring(0, 3)}",
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
    );
