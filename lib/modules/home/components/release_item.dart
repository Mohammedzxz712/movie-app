import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../models/RealeaseModel.dart';
import '../../../models/navigate_model.dart';
import '../../details/details_screen.dart';

Widget releaseItem(List<ResultsRelease>? results, context) => Container(
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
                    arguments: NavigateModel(results?[index].id),
                  );
                  LayoutCubit.get(context)
                      .getDetailsData(results?[index].id);
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${results?[index].backdropPath}",
                        ),
                        fit: BoxFit.cover,
                        height: 127.74.h,
                        width: 96.87.w,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        LayoutCubit.get(context).addToWatchlist(
                          results?[index].title ?? '',
                          results?[index].overview ?? '',
                          "https://image.tmdb.org/t/p/w500${results?[index].backdropPath}",
                          results?[index].releaseDate ?? '',
                        );
                        const AlertDialog(actions: [
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
            itemCount: results?.length,
          ),
        )
      ],
    ),
  ),
);