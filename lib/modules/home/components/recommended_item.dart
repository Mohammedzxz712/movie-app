import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Import necessary models and providers
import '../../../models/RecommendedModel.dart';
import '../../../models/navigate_model.dart';
import '../../../provider/provider.dart';
import '../../../layout/cubit/cubit.dart';
import '../../details/details_screen.dart';

class RecommendedItem extends StatefulWidget {
  final List<ResultsRecommended>? results;

  RecommendedItem(this.results);

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);

    return Container(
      height: 285.h,
      width: double.infinity,
      color: const Color(0xff282A28),
      child: Padding(
        padding: EdgeInsets.only(left: 21.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended',
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
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: NavigateModel(widget.results?[index].id),
                    );
                    LayoutCubit.get(context).getDetailsData(widget.results?[index].id);
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
                                "https://image.tmdb.org/t/p/w500${widget.results?[index].backdropPath}",
                              ),
                              fit: BoxFit.cover,
                              height: 127.74.h,
                              width: 96.87.w,
                            ),
                          ),
                          Positioned(
                            top: -4.1,
                            left: -7.4,
                            child: InkWell(
                              onTap: () {
                                int itemId = widget.results?[index].id?.toInt() ?? 1;
                                bool isWatchlisted =
                                watchlistProvider.watchlistItems.contains(itemId);

                                if (isWatchlisted) {
                                  LayoutCubit.get(context).removeFromWatchlist(itemId);
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
                                    watchlistProvider.removeFromWatchlist(itemId);
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
                                color: watchlistProvider.watchlistItems.contains(widget.results?[index].id)
                                    ? Color(0xffFFBB3B)
                                    : Color(0xff514F4F), // Default color
                                size: 38.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w),
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
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
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
                                  '${widget.results?[index].voteAverage?.toStringAsFixed(1)}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${widget.results?[index].title}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              '${widget.results?[index].releaseDate}',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.grey,
                              ),
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
                    : LayoutCubit.get(context).recommendedModel!.results!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
