import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../models/SimilarModel.dart';
import '../../../provider/provider.dart';

class MoreLikeThisItem extends StatefulWidget {
  final List<ResultsSimilar>? results;

  const MoreLikeThisItem({Key? key, this.results}) : super(key: key);

  @override
  State<MoreLikeThisItem> createState() => _MoreLikeThisItemState();
}

class _MoreLikeThisItemState extends State<MoreLikeThisItem> {
  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);

    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: Container(
        height: 295.h,
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
                                  "https://image.tmdb.org/t/p/w500${widget.results?[index].backdropPath}",
                              fit: BoxFit.cover,
                              height: 127.74.h,
                              width: 96.87.w,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: Color(0xffFFBB3B),
                              )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Positioned(
                            top: -4.1,
                            left: -7.4,
                            child: InkWell(
                              onTap: () {
                                int itemId =
                                    widget.results?[index].id?.toInt() ?? 1;
                                bool isWatchlisted = watchlistProvider
                                    .watchlistItems
                                    .contains(itemId);

                                if (isWatchlisted) {
                                  LayoutCubit.get(context)
                                      .removeFromWatchlist(itemId);
                                } else {
                                  LayoutCubit.get(context).addToWatchlist(
                                    widget.results?[index].title ?? '',
                                    widget.results?[index].overview ?? '',
                                    "https://image.tmdb.org/t/p/w500${widget.results?[index].backdropPath}",
                                    widget.results?[index].releaseDate ?? '',
                                    true,
                                    itemId,
                                  );
                                }

                                // Toggle the watchlist state for the current item
                                setState(() {
                                  if (isWatchlisted) {
                                    watchlistProvider
                                        .removeFromWatchlist(itemId);
                                  } else {
                                    watchlistProvider.addToWatchlist(itemId);
                                  }
                                });
                                const AlertDialog(actions: [
                                  Text('Item added to watchlist '),
                                ]);
                              },
                              child: Icon(
                                Icons.bookmark_add_rounded,
                                color: watchlistProvider.watchlistItems
                                        .contains(widget.results?[index].id)
                                    ? Color(0xffFFBB3B)
                                    : Color(0xff514F4F), // Default color
                                size: 38.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w),
                        height: 90.h,
                        width: 96.w,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF343534),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFBB3B),
                                  size: 15.r,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  "${widget.results?[index].voteAverage.toString().substring(0, 3)}",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.white),
                                )
                              ],
                            ),
                            Text(
                              "${widget.results?[index].title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.white),
                            ),
                            Text(
                              "${widget.results?[index].releaseDate}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 8.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
