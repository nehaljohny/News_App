import 'package:flutter/material.dart';
import 'package:newsapp/Controller/searchscreenController.dart';
import 'package:provider/provider.dart';
import 'Controller/bottomNavcontroller.dart';
import 'Controller/categoryController.dart';
import 'Controller/homeScreenController.dart';
import 'Controller/splashController.dart';
import 'View/bottonNavBar/mainPage.dart';
import 'View/splashScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchScreenController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, widget) {
              return splashScreenProvider.isLoading
                  ? SplashScreen()
                  : MainPage(); // Replace with your home screen
            },
          ),
        ));
  }
}