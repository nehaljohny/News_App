import 'package:flutter/cupertino.dart';
import 'package:newsapp/View/category%20Screen/category_screen.dart';
import 'package:newsapp/View/home%20Screen/home_screen.dart';
import 'package:newsapp/View/search%20Screen/search_screen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen()
  ];
}