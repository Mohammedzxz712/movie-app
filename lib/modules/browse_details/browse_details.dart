import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/navigate_model.dart';
import 'package:movie_app/modules/details/cubit/cubit.dart';
import 'package:movie_app/modules/details/cubit/states.dart';

class BrowseDetails extends StatelessWidget {
  const BrowseDetails({super.key});

  static const String routeName = "browse details";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1D1E1D),
          title: SizedBox(
            width: 300.w,
            height: 31.h,
            child: Text(
              'title',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Stack(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNf8BJrOYOERBM0mYzBsj7rVR9fRXZwhNC8Q&usqp=CAU}'),
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
                                  AssetImage("assets/images/iconPlay.png"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "releaseDate",
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
            separatorBuilder: (context, index) =>
                Divider(color: Color(0xFF707070)),
            itemCount: 10));
  }
}
