import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return SafeArea(
            child: Scaffold(
                body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'search is required';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          SearchCubit.get(context)
                              .searchData(searchController.text);
                        }
                      },
                      // onChanged: (value) => SearchCubit.get(context)
                      //     .searchData(searchController.text),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    if (state is SearchLoadingStates)
                      const LinearProgressIndicator(),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (cubit.searchModel != null)
                      Expanded(
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w500${cubit.searchModel?.results?[index].backdropPath}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${cubit.searchModel?.results?[index].title}",
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
                                          "${cubit.searchModel?.results?[index].releaseDate?.substring(0, 4)}",
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
                                          "${cubit.searchModel?.results?[index].originalTitle}",
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
                            separatorBuilder: (context, index) => Divider( color:Color(0xFF707070)),
                            itemCount: 10),
                      ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}

// IconButton(
// onPressed: () {
// // ShopCubit.get(context)
// //     .changeFavorites(
// //         (model.product?.id)!);
// },
// icon: CircleAvatar(
// // backgroundColor: ShopCubit
// //             .get(context)
// //         .favorite![model.id]!
// //     ? Colors.orange
// //     : Colors.grey[350],
// child: const Icon(
// Icons.favorite_border,
// size: 17,
// color: Colors.white,
// ),
// ),
// ),
