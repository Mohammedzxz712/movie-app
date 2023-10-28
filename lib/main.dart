import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared/bloc_observer.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';
import 'package:movie_app/shared/style/my_theme.dart';

import 'layout/layout_screen/layout_screen.dart';
import 'modules/browse_details/browse_details.dart';
import 'modules/details/details_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: LayoutScreen.routeName,
        routes: {
          LayoutScreen.routeName: (context) => LayoutScreen(),
          DetailsScreen.routeName: (context) => DetailsScreen(),
          BrowseDetails.routeName: (context) => BrowseDetails(),
        },
      ),
    );
  }
}
