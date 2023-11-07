import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/layout/cubit/cubit.dart';
import 'package:movie_app/layout/cubit/states.dart';
import 'package:movie_app/models/navigate_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/components/components.dart';
import '../details/details_screen.dart';
import 'components/page_item.dart';
import 'components/recommended_item.dart';
import 'components/release_item.dart';

class HomeScreen extends StatelessWidget {
  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return ConditionalBuilder(
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 313.h,
                            child: PageView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      DetailsScreen.routeName,
                                      arguments: NavigateModel(
                                          cubit.homeModel?.results[index].id),
                                    );
                                    cubit.getDetailsData(
                                        cubit.homeModel?.results[index].id);
                                  },
                                  child: pageItem(
                                      cubit.homeModel?.results[index])),
                              itemCount: 3,
                              controller: boardController,
                              onPageChanged: (int index) {},
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: boardController,
                            count: 3,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Colors.orange,
                              dotColor: Colors.grey,
                              dotHeight: 11,
                              dotWidth: 11,
                              expansionFactor: 3,
                              spacing: 5,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  releaseItem(cubit.releaseModel?.results, context),
                  SizedBox(
                    height: 30.h,
                  ),
                  recommendedItem(cubit.recommendedModel?.results, context),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(
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
