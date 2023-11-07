import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/BrowseNavigate.dart';
import 'package:movie_app/modules/browse/cubit/cubit.dart';
import 'package:movie_app/modules/browse/cubit/states.dart';
import 'package:movie_app/shared/components/components.dart';

import '../../shared/components/constant.dart';
import '../browse_details/browse_details.dart';
import 'components/browse_item.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => BrowseNamCubit()..getBrowseNamData(),
      child: BlocConsumer<BrowseNamCubit, BrowseNamStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BrowseNamCubit.get(context);
          return ConditionalBuilder(
            builder: (context) => Scaffold(
              body: browseItem(cubit.browseModelName, context, size),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
            condition: cubit.browseModelName?.genres != null,
          );
        },
      ),
    );
  }
}
