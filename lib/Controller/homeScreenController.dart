import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/news_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";

  /// To PROCESS API AND GET RESPONSE
  fetchData() async {
    isLoading = true;
    final url =
        "$baseUrl/v2/top-headlines?country=in&apiKey=a816b772f1cf456492c79a51b4e9efa6";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api Failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  /// TO SHARE NEWS
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error Sharing: $e");
    }
    notifyListeners();
  }

  /// FUNCTION TO LAUNCH URL
  Future<void> launchURL(String url) async{
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1, mode: LaunchMode.inAppWebView)){
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        throw "Could not launch $url";
      }
    } catch (e) {
      print("Error launching URL: $e");
    }
    notifyListeners();
  }
}
