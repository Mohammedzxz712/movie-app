import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
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
                    // if (SearchCubit.get(context).searchModel != null)
                    Expanded(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                                height: 120,
                                child: Row(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNf8BJrOYOERBM0mYzBsj7rVR9fRXZwhNC8Q&usqp=CAU}'),
                                      // fit: BoxFit.cover,
                                      width: 120,
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
                                              'lita Battle Angel',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  height: 1.3,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '2019',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            // if (model.oldPrice != 0 &&
                                            //     isDiscount == true)
                                            Text(
                                              'Rosa Salazar, Christoph Waltz',
                                              overflow: TextOverflow.ellipsis,
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
