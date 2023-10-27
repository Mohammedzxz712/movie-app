import 'package:flutter/material.dart';

class ViewMovie extends StatelessWidget {
  const ViewMovie({super.key});

  static const String routeName = "ViewMovie";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E1D),
        title: SizedBox(
          width: 300,
          height: 31,
          child: Text(
            'Dora and the lost city of gold',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/mainFilm.png"),
                    //fit: BoxFit.cover,
                    height: 217,
                    width: double.infinity,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage("assets/images/iconPlay.png"),
                      //fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Stack(
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
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: size.width * 0.2,
                                    height: size.width * 0.07,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFF514F4F)),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Action',
                                        style: TextStyle(
                                          color: Color(0xFFCBCBCB),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    height: size.width * 0.07,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFF514F4F)),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Action',
                                        style: TextStyle(
                                          color: Color(0xFFCBCBCB),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height*0.02,),
                              SizedBox(
                                child: Text(
                                  'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ',
                                  style: TextStyle(
                                    color: Color(0xFFCBCBCB),
                                    fontSize: 13,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height*0.02,),

                              Row(
                                children: [
                                  Icon(Icons.star,color:Color(0xffFFBB3B),),
                                  Text(
                                    '7.7',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
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
                            'More Like This',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
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
          ],
        ),
      ),
    );
  }
}
