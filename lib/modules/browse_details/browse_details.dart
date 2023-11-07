import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/BrowseNavigate.dart';
import 'package:movie_app/modules/browse_details/cubit/states.dart';
import 'package:movie_app/shared/components/components.dart';
import 'components/details_item.dart';
import 'cubit/cubit.dart';

class BrowseDetails extends StatelessWidget {
  const BrowseDetails({super.key});

  static const String routeName = "browse details";

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: const Color(0xFF1D1E1D),
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
                body: browseDetailsItem(
                    cubit.browseDetailsModel?.results, context)),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            ),),
          );
        },
      ),
    );
  }
}
