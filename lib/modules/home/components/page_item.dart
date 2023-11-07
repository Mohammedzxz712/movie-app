import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/HomeModel.dart';

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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage("assets/images/iconPlay.png"),
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
