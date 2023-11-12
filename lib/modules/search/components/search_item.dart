import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/assets.dart';
import '../../../models/SearchModel.dart';
import '../../../models/navigate_model.dart';
import '../../details/cubit/cubit.dart';
import '../../details/details_screen.dart';
import '../cubit/cubit.dart';

var searchController = TextEditingController();
var formKey = GlobalKey<FormState>();
Widget searchItem(List<ResultsSearch>? results, context) => Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'search is required';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              results = null;
              if (formKey.currentState!.validate()) {
                SearchCubit.get(context).searchData(searchController.text);
              }
            },
            onChanged: (value) =>
                SearchCubit.get(context).searchData(searchController.text),
            controller: searchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              filled: true,
              fillColor: Color(0xff514F4F),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'search',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 29.h,
          ),
          if (results == null) const LinearProgressIndicator(),
          SizedBox(
            height: 271.h,
          ),
          if (results == null)
            Center(child: Image.asset(Assets.imagesGroup22,height:114.50 .h,width: 104.w,)),
          if (results != null)
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: NavigateModel(results?[index].id),
                          );
                          DetailsCubit.get(context)
                              .getDetailsData(results?[index].id);
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${results?[index].backdropPath}",
                                fit: BoxFit.cover,
                                width: 140.w,
                                height: 89.h,
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(12.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${results?[index].title}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "${results?[index].releaseDate}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      "${results?[index].originalTitle}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      Divider(color: Color(0xFF707070)),
                  itemCount: results!.length),
            ),
        ],
      ),
    );
