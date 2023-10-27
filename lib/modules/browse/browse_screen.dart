import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
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
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * 0.08,
                    crossAxisSpacing: size.height * 0.04,
                    childAspectRatio: 1.5),
                itemBuilder: (context, index) {
                  return GridTile(
                      child: Opacity(
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
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNf8BJrOYOERBM0mYzBsj7rVR9fRXZwhNC8Q&usqp=CAU}'),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Center(
                            child: Text('Action',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                )),
                          )
                        ],
                      ),
                    ),
                  ));
                },
                itemCount:
                    6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
