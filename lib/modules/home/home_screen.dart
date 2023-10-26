import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 289,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/mainFilm.png"),
                    //fit: BoxFit.cover,
                    height: 217,
                    width: double.infinity,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage("assets/images/rImage.png"),
                                //fit: BoxFit.cover,
                                height: 199,
                                width: 129,
                              ),
                              Container(
                                height: 24,
                                color: Colors.grey,
                                width: 23,
                                child: Icon(Icons.add),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(
                            image: AssetImage("assets/images/iconPlay.png"),
                            //fit: BoxFit.cover,
                            height: 100,
                          ),
                          Text(
                            "Dora and the lost city of gold",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "2019 PG-13 2h 7m",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 187,
              width: double.infinity,
              color: Color(0xff282A28),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Release',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Stack(
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/images/film_1.png"),
                                    fit: BoxFit.cover,
                                    height: 127.74,
                                    width: 96.87,
                                  ),
                                  Container(
                                    height: 24,
                                    color: Colors.grey,
                                    width: 22,
                                    child: Icon(Icons.add),
                                  )
                                ],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: 10),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 246,
              width: double.infinity,
              color: Color(0xff282A28),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recomended',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/images/recom_1.png"),
                                        fit: BoxFit.cover,
                                        height: 127.74,
                                        width: 96.87,
                                      ),
                                      Container(
                                        height: 24,
                                        color: Colors.grey,
                                        width: 22,
                                        child: Icon(Icons.add),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffFFBB3B),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '7.7',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Deadpool 2',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '2018 R lh 59m',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: 10),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
