import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/BrowseModelName.dart';
import '../../../models/BrowseNavigate.dart';
import '../../../shared/components/constant.dart';
import '../../browse_details/browse_details.dart';

Widget browseItem(BrowseModelName? browseModelName, context, size) => Padding(
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
                    Navigator.pushNamed(context, BrowseDetails.routeName,
                        arguments: BrowseNavigateDetails(
                            browseModelName?.genres?[index].id,
                            browseModelName?.genres?[index].name));
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
                      child: CachedNetworkImage(
                        imageUrl: imageUrl[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                            )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Center(
                      child: Text('${browseModelName?.genres?[index].name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    )
                  ]),
                ));
          },
          itemCount: browseModelName?.genres?.length,
        ),
      )
    ],
  ),
);