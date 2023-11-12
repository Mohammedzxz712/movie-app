import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../layout/cubit/cubit.dart';
import '../../../models/HomeModel.dart';
import '../../../provider/provider.dart';

class PageItem extends StatefulWidget {
  final Results? results;
  final int index; // Add index as a parameter

  const PageItem({Key? key, this.results, required this.index}) : super(key: key);

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  final Set<int> watchlistItems = Set<int>();

  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${widget.results?.backdropPath}"),
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
                            "https://image.tmdb.org/t/p/w500${widget.results?.posterPath}"),
                        height: 199.h,
                        width: 129.w,
                      ),
                    ),
                    Positioned(
                      top: -4.1,
                      left: -7.4,
                      child: InkWell(
                        onTap: () {
                          int itemId = widget.results?.id?.toInt() ?? 1;
                          bool isWatchlisted = watchlistProvider.watchlistItems.contains(itemId);

                          if (isWatchlisted) {
                            LayoutCubit.get(context).removeFromWatchlist(itemId);
                          } else {
                            LayoutCubit.get(context).addToWatchlist(
                              widget.results?.title ?? '',
                              widget.results?.overview ?? '',
                              "https://image.tmdb.org/t/p/w500${widget.results?.backdropPath}",
                              widget.results?.releaseDate ?? '',
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
                        },
                        child: Icon(
                          Icons.bookmark_add_rounded,
                          color: watchlistProvider.watchlistItems.contains(widget.results?.id)
                              ? Color(0xffFFBB3B)
                              : Color(0xff514F4F), // Default color
                          size: 38.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage("assets/images/iconPlay.png"),
                    height: 60.h,
                    width: 60.w,
                  ),
                  SizedBox(
                    height: 92.h,
                  ),
                  Text(
                    "${widget.results?.title}",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${widget.results?.releaseDate}",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
