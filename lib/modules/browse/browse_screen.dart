import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/browse/cubit/cubit.dart';
import 'package:movie_app/modules/browse/cubit/states.dart';

import '../browse_details/browse_details.dart';

class BrowseScreen extends StatelessWidget {
  List<String> photo = [];

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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: size.width * 0.08,
                            crossAxisSpacing: size.height * 0.04,
                            childAspectRatio: 1.5),
                        itemBuilder: (context, index) {
                          return GridTile(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(
                                      context, BrowseDetails.routeName);
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNf8BJrOYOERBM0mYzBsj7rVR9fRXZwhNC8Q&usqp=CAU}'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
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
