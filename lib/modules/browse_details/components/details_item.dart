import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/BrowseDetailsModel.dart';
import '../../../models/navigate_model.dart';
import '../../details/details_screen.dart';
import '../cubit/cubit.dart';

Widget browseDetailsItem(List<ResultsBrowseDetails>? results, context) =>  ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: NavigateModel(results?[index]
                    .id),
              );
              BrowseDetailsCubit.get(context).getDetailsData(results?[index].id);
            },
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                  "https://image.tmdb.org/t/p/w500${results?[index].backdropPath}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                  const Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      )),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
                Positioned(
                  top: 79.h,
                  left: 176.w,
                  right: 176.w,
                  child: Image(
                    image: const AssetImage(
                        "assets/images/iconPlay.png"),
                    //fit: BoxFit.cover,
                    height: 60.h,
                    width: 60.w,
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15.w, vertical: 13.h),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            1.4,
                        child: Text(
                          "${results?[index].title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: const Color(0xffFFBB3B),
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "${results?[index].voteAverage?.toStringAsFixed(1)}",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "${results?[index].overview}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "${results?[index].releaseDate}",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0xFFB5B4B4),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ]),
    itemCount: results?.length);