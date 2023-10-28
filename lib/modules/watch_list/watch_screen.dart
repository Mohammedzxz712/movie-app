import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Watchlist',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding:  EdgeInsets.all(8.h),
                    child: Row(
                      children: [
                        Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNf8BJrOYOERBM0mYzBsj7rVR9fRXZwhNC8Q&usqp=CAU}'),
                              fit: BoxFit.cover,
                              width: 140.w,
                              height: 89.h,
                            ),
                          ),
                          Positioned(
                            top: -5.h,
                            left: -8.w,
                            child: Icon(
                              Icons.bookmark,
                              color: Color(0xffeeb54a),
                              size: 38.h,
                            ),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18.h,
                          )
                        ]),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'lita Battle Angel',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  '2019',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                // if (model.oldPrice != 0 &&
                                //     isDiscount == true)
                                Text(
                                  'Rosa Salazar, Christoph Waltz',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                          color: Color(
                        0xFF707070,
                      )),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
