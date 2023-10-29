import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/BrowseNavigate.dart';
import 'package:movie_app/modules/browse_details/cubit/states.dart';

import 'cubit/cubit.dart';

class BrowseDetails extends StatelessWidget {
  const BrowseDetails({super.key});

  static const String routeName = "browse details";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var args =
        ModalRoute.of(context)?.settings.arguments as BrowseNavigateDetails;
    return BlocProvider(
      create: (context) => BrowseDetailsCubit()..getDetailsData(args.id),
      child: BlocConsumer<BrowseDetailsCubit, BrowseDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BrowseDetailsCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.browseDetailsModel != null,
            builder: (context) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xFF1D1E1D),
                  title: SizedBox(
                    width: 300.w,
                    height: 31.h,
                    child: Text(
                      '${args.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  centerTitle: true,
                ),
                body: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w500${cubit.browseDetailsModel?.results?[index].backdropPath}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                      color: Colors.yellow,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  Positioned(
                                    top: 79.h,
                                    left: 176.w,
                                    right: 176.w,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/iconPlay.png"),
                                      //fit: BoxFit.cover,
                                      height: 60.h,
                                      width: 60.w,
                                    ),
                                  ),
                                ],
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
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.4,
                                            child: Text(
                                              "${cubit.browseDetailsModel?.results?[index].title}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xffFFBB3B),
                                                size: 20.sp,
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Text(
                                                "${cubit.browseDetailsModel?.results?[index].voteAverage?.toStringAsFixed(1)}",
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
                                        "${cubit.browseDetailsModel?.results?[index].overview}",
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
                                        "${cubit.browseDetailsModel?.results?[index].releaseDate}",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xFFB5B4B4),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ]),
                    itemCount: cubit.browseDetailsModel?.results?.length)),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            )),
          );
        },
      ),
    );
  }
}
