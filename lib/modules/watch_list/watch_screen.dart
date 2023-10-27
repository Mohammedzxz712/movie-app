import 'package:flutter/material.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height*0.08,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
            child: Text(
              'Watchlist',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
                        width: 130,
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
                separatorBuilder: (context, index) => Divider(color: Color(0xFF707070),indent: 20,endIndent: 20,),
                itemCount: 4),
          ),
        ],
      ),
    );
  }
}
