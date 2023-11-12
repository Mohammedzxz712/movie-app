import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/navigate_model.dart';
import 'package:movie_app/modules/details/cubit/cubit.dart';
import 'package:movie_app/modules/details/cubit/states.dart';
import 'package:movie_app/shared/components/components.dart';

import 'components/mini_photo_item.dart';
import 'components/more_link_item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = "details";
  @override
  Widget build(BuildContext context) {
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
                  width: 300.w,
                  height: 31.h,
                  child: Text(
                    '${cubit.detailsModel?.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${cubit.detailsModel?.backdropPath}"),
                          fit: BoxFit.cover,
                          height: 217.h,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 79.h,
                          left: 176.w,
                          right: 176.w,
                          child: Image(
                            image:
                                const AssetImage("assets/images/iconPlay.png"),
                            //fit: BoxFit.cover,
                            height: 60.h,
                            width: 60.w,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [

                        miniPhotoAndDescriptionItemInDetails(
                            cubit.detailsModel, context),
                        MoreLikeThisItem(results: cubit.similarModel?.results,)

                      ],
                    ),
                  ],
                ),
              ),
            ),
            condition: cubit.detailsModel != null && cubit.similarModel != null,
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFFBB3B),
              ),
            ),
          );
        },
      ),
    );
  }
}
