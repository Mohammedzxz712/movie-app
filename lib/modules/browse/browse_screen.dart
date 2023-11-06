import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/BrowseNavigate.dart';
import 'package:movie_app/modules/browse/cubit/cubit.dart';
import 'package:movie_app/modules/browse/cubit/states.dart';

import '../browse_details/browse_details.dart';

class BrowseScreen extends StatelessWidget {
  List<String> photo = [];
  List<String> imageUrl = [
    'https://pic.i7lm.com/wp-content/uploads/2019/05/%D8%A7%D8%AC%D9%85%D9%84-%D8%B5%D9%88%D8%B1-%D8%A7%D9%83%D8%B4%D9%86.jpg',
    'https://images.pexels.com/photos/2829336/pexels-photo-2829336.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images3.alphacoders.com/133/thumbbig-1337063.webp',
    'https://media.istockphoto.com/id/1317000702/photo/comedy-movie-genre-concept-film-reel-forming-the-red-comedy-word-on-white-background.jpg?s=612x612&w=0&k=20&c=fS0Aa4HtXtHzUwQkocUs6500RsqEl8Exc9uYvOWKV_s=',
    'https://orion-uploads.openroadmedia.com/md_81afe139738e-cimemovies_sicario.jpg',
    'https://st.depositphotos.com/1616496/4500/i/450/depositphotos_45001913-stock-photo-reportage.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/disp/3c0d0467250999.5b330d0dbc16a.jpg',
    'https://previews.123rf.com/images/svetlanaborovkova/svetlanaborovkova1808/svetlanaborovkova180800385/106392051-happy-family-poster-with-parents-kids-and-pet-flat-style-design-vector-background.jpg',
    'https://imgc.allpostersimages.com/img/posters/john-stephens-genesis-ii-art-poster-print_u-L-F57QJE0.jpg?artPerspective=n',
    'https://hornedmajesty666.files.wordpress.com/2017/12/dunkirk.jpg',
    'https://www.psichi.org/resource/resmgr/06_publications-news/blog/volume6/22Blog_Horror_Movies.jpg',
    'https://www.intofilm.org/intofilm-production/2929/scaledcropped/1170x658/resources/2929/sing-still.jpg',
    'data:image/jpeg;base64,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',
    'https://img.moviepostershop.com/the-tv-set-movie-poster-2006-1010484090.jpg',
    'https://img.moviepostershop.com/the-tv-set-movie-poster-2006-1010484090.jpg',
    'https://img.moviepostershop.com/the-tv-set-movie-poster-2006-1010484090.jpg',
    'http://windsorgirls.weebly.com/uploads/2/3/5/5/23550344/5243220.jpg?402',
    'https://m.media-amazon.com/images/I/612lUbYDkxL._AC_SL1024_.jpg',
    'https://cdn.vectorstock.com/i/preview-1x/93/65/western-movies-poster-template-vector-34139365.webp',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => BrowseNamCubit()..getBrowseNamData(),
      child: BlocConsumer<BrowseNamCubit, BrowseNamStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BrowseNamCubit.get(context);
          return ConditionalBuilder(
            builder: (context) => Scaffold(
              body: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse Category ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: size.width * 0.08,
                            crossAxisSpacing: size.height * 0.04,
                            childAspectRatio: 1.5),
                        itemBuilder: (context, index) {
                          return GridTile(
                              child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, BrowseDetails.routeName,
                                  arguments: BrowseNavigateDetails(
                                      cubit.browseModelName?.genres?[index].id,
                                      cubit.browseModelName?.genres?[index]
                                          .name));
                            },
                            child: Stack(children: [
                              Opacity(
                                opacity: 0.37,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF343534),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x29000000),
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child:
                                CachedNetworkImage(
                                  imageUrl:
                                  imageUrl[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
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

                              ),
                              Center(
                                child: Text(
                                    '${cubit.browseModelName?.genres?[index].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            ]),
                          ));
                        },
                        itemCount: cubit.browseModelName?.genres?.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            )),
            condition: cubit.browseModelName?.genres != null,
          );
        },
      ),
    );
  }
}
