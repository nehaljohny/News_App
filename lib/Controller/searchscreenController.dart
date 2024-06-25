import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsapp/Model/news_model.dart';

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=publishedAt&apiKey=a816b772f1cf456492c79a51b4e9efa6");
    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api Failed");
      }
    } catch (e) {
      print("Error:$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
