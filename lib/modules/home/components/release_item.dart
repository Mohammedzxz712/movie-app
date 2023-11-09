import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../models/RealeaseModel.dart';
import '../../../models/navigate_model.dart';
import '../../../provider/provider.dart';
import '../../details/details_screen.dart';

class ReleaseItem extends StatefulWidget {
  final List<ResultsRelease>? results;

  ReleaseItem(this.results);

  @override
  _ReleaseItemState createState() => _ReleaseItemState();
}

class _ReleaseItemState extends State<ReleaseItem> {
  final Set<int> watchlistItems = Set<int>();

  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);

    return Container(
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
                        arguments: NavigateModel(widget.results?[index].id),
                      );
                      LayoutCubit.get(context)
                          .getDetailsData(widget.results?[index].id);
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
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
                              // LayoutCubit.get(context).addToWatchlist(
                              //   widget.results?[index].title ?? '',
                              //   widget.results?[index].overview ?? '',
                              //   "https://image.tmdb.org/t/p/w500${widget.results?[index].backdropPath}",
                              //   widget.results?[index].releaseDate ?? '',
                              //   true,
                              //   widget.results?[index].id ?? 1,
                              // );
                              //
                              // // Toggle the watchlist state for the current item
                              // if (watchlistProvider.watchlistItems.contains(widget.results?[index].id)) {
                              //   watchlistProvider.removeFromWatchlist(widget.results?[index].id?.toInt() ?? 1);
                              // } else {
                              //   watchlistProvider.addToWatchlist(widget.results?[index].id?.toInt() ?? 1);
                              // }

                              // setState(() {
                              //   if (watchlistItems.contains(widget.results?[index].id)) {
                              //     watchlistItems.remove(widget.results?[index].id);
                              //   } else {
                              //     watchlistItems.add(widget.results?[index].id?.toInt() ?? 1,
                              //     );
                              //   }
                              // });
                              int itemId = widget.results?[index].id?.toInt() ?? 1;
                              bool isWatchlisted = watchlistProvider.watchlistItems.contains(itemId);

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
                                  ?Color(0xffFFBB3B)
                                  : Color(0xff514F4F), // Default color
                              size: 38.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: widget.results?.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
