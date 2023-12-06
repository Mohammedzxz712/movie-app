import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/provider/provider.dart';
import 'package:movie_app/shared/bloc_observer.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';
import 'package:movie_app/shared/style/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'layout/layout_screen/layout_screen.dart';
import 'modules/browse_details/browse_details.dart';
import 'modules/details/details_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MultiProvider(  providers: [
    ChangeNotifierProvider(
      create: (_) => WatchlistProvider(prefs),
    ),  ],child: const MyApp()));
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
