import 'package:flutter/material.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'lita Battle Angel',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  height: 1.3, color: Colors.white),
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
    );
  }
}
