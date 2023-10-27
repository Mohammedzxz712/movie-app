import 'package:flutter/material.dart';
import 'colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xffFFBB3B),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
          color: Color(0xFFB5B4B4),
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 2),
      unselectedLabelStyle: TextStyle(
          color: Color(0xFFB5B4B4),
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 2),
    ),
    // textTheme: TextTheme(
    //   bodyLarge: GoogleFonts.elMessiri(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 15,
    //     color: Colors.black,
    //   ),
    //   bodyMedium: GoogleFonts.elMessiri(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 15,
    //     color: Colors.black,
    //   ),
    //   bodySmall: GoogleFonts.elMessiri(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 15,
    //     color: Colors.black,
    //   ),
    // ),
  );
  static ThemeData darkTheme = ThemeData();
}
