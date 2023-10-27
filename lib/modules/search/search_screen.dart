import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
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
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff514F4F),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          labelText: 'search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is SearchLoadingStates)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10,
                    ),
                    if (cubit.searchModel != null)
                      Expanded(
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                                  height: 120,
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/w500${cubit.searchModel?.results?[index].backdropPath}",
                                        fit: BoxFit.cover,
                                        width: 120,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.yellow,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${cubit.searchModel?.results?[index].title}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    height: 1.3,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${cubit.searchModel?.results?[index].releaseDate?.substring(0, 4)}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "${cubit.searchModel?.results?[index].originalTitle}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
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
                            separatorBuilder: (context, index) => Divider(),
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
