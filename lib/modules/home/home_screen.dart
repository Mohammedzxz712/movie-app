import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/models/navigate_model.dart';

import '../details/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return ConditionalBuilder(
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 289,
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${cubit.homeModel?.results[0].backdropPath}"),
                          //fit: BoxFit.cover,
                          height: 217,
                          width: double.infinity,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500${cubit.homeModel?.results[0].posterPath}"),
                                      //fit: BoxFit.cover,
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
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                  image:
                                      AssetImage("assets/images/iconPlay.png"),
                                  //fit: BoxFit.cover,
                                  height: 100,
                                ),
                                Text(
                                  "${cubit.homeModel?.results[0].title}",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "${cubit.homeModel?.results[0].releaseDate}",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 187,
                    width: double.infinity,
                    color: Color(0xff282A28),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Release',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.routeName,
                                            arguments: NavigateModel(cubit
                                                .releaseModel
                                                ?.results?[index]
                                                ?.id));
                                        cubit.getDetailsData(cubit
                                            .releaseModel?.results?[index]?.id);
                                      },
                                      child: Stack(
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500${cubit.releaseModel?.results?[index].backdropPath}"),
                                            fit: BoxFit.cover,
                                            height: 127.74,
                                            width: 96.87,
                                          ),
                                          Container(
                                            height: 24,
                                            color: Colors.grey,
                                            width: 22,
                                            child: Icon(Icons.add),
                                          )
                                        ],
                                      ),
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                itemCount: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 246,
                    width: double.infinity,
                    color: Color(0xff282A28),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recomended',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.routeName,
                                            arguments: NavigateModel(cubit
                                                .recommendedModel
                                                ?.results?[index]
                                                ?.id));
                                        cubit.getDetailsData(cubit
                                            .releaseModel?.results?[index]?.id);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Image(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500${cubit.recommendedModel?.results?[index].backdropPath}"),
                                                fit: BoxFit.cover,
                                                height: 127.74,
                                                width: 96.87,
                                              ),
                                              Container(
                                                height: 24,
                                                color: Colors.grey,
                                                width: 22,
                                                child: Icon(Icons.add),
                                              )
                                            ],
                                          ),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xffFFBB3B),
                                              ),
                                              Text(
                                                '${cubit.recommendedModel?.results?[index].voteAverage}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 96.87,
                                            child: Text(
                                              '${cubit.recommendedModel?.results?[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: 96.87,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              '${cubit.recommendedModel?.results?[index].releaseDate}',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                itemCount: cubit.recommendedModel == null
                                    ? 10
                                    : cubit.recommendedModel!.results!.length),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          ),
          condition: cubit.homeModel != null,
        );
      },
    );
  }
}
