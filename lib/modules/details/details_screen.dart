import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/navigate_model.dart';
import 'package:movie_app/modules/details/cubit/cubit.dart';
import 'package:movie_app/modules/details/cubit/states.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)?.settings.arguments as NavigateModel;
    return BlocProvider(
      create: (context) => DetailsCubit()
        ..getDetailsData(args.id)
        ..getSimilarData(args.id),
      child: BlocConsumer<DetailsCubit, DetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DetailsCubit.get(context);
          return ConditionalBuilder(
            builder: (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF1D1E1D),
                title: SizedBox(
                  width: 300,
                  height: 31,
                  child: Text(
                    '${cubit.detailsModel?.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      child: Stack(
                        children: [
                          Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${cubit.detailsModel?.backdropPath}"),
                            //fit: BoxFit.cover,
                            height: 217,
                            width: double.infinity,
                          ),
                          Center(
                            child: Image(
                              image: AssetImage("assets/images/iconPlay.png"),
                              //fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${cubit.detailsModel?.title}",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${cubit.detailsModel?.releaseDate}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${cubit.detailsModel?.backdropPath}"),
                                    fit: BoxFit.cover,
                                    height: 199,
                                    width: 129,
                                  ),
                                  Container(
                                    height: 24,
                                    color: Colors.grey,
                                    width: 23,
                                    child: Icon(Icons.add),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: size.width * 0.2,
                                        height: size.width * 0.07,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF514F4F)),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${cubit.detailsModel?.genres?[0].name}",
                                            style: TextStyle(
                                              color: Color(0xFFCBCBCB),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          "${cubit.detailsModel?.overview}",
                                          maxLines: 7,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFFCBCBCB),
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffFFBB3B),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${cubit.detailsModel?.voteAverage.toString().substring(0, 3)}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 260,
                            width: double.infinity,
                            color: Color(0xff282A28),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'More Like This',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                          "https://image.tmdb.org/t/p/w500${cubit.similarModel?.results?[index].backdropPath}",
                                                      fit: BoxFit.cover,
                                                      height: 127.74,
                                                      width: 96.87,
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                        color: Colors.yellow,
                                                      )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                    Container(
                                                      height: 24,
                                                      color: Colors.grey,
                                                      width: 22,
                                                      child: Icon(Icons.add),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffFFBB3B),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "${cubit.similarModel?.results?[index].voteAverage.toString().substring(0, 3)}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  width: 96.87,
                                                  child: Text(
                                                    "${cubit.similarModel?.results?[index].title}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text(
                                                  "${cubit.similarModel?.results?[index].releaseDate}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              width: 10,
                                            ),
                                        itemCount: 10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            condition: cubit.detailsModel != null && cubit.similarModel != null,
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
          );
        },
      ),
    );
  }
}
