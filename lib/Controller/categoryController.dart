import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newsapp/Model/news_model.dart';
import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;
  List<String> categorylist = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "business";
  onTap({required int index}) {
    category = categorylist[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

   fetchData() async{
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a816b772f1cf456492c79a51b4e9efa6");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    }else{
      print("API Failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
   }
}
