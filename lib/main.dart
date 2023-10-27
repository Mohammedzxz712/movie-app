import 'package:flutter/material.dart';
import 'package:movie_app/modules/splash/splash_screen.dart';
import 'package:movie_app/shared/style/my_theme.dart';

import 'layout/layout_screen/layout_screen.dart';
import 'modules/view_movie/view_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) =>SplashScreen(),
        LayoutScreen.routeName: (context) =>LayoutScreen(),
        ViewMovie.routeName: (context) =>ViewMovie()

      },
    );
  }
}
