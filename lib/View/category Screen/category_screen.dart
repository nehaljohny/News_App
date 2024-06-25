import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/Controller/categoryController.dart';
import 'package:newsapp/widget/newscard.dart';
import 'package:provider/provider.dart';

import '../../Utils/textTheme.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch data when the screen initializes
    Provider.of<CategoryController>(context, listen: false).fetchData();

    return Consumer<CategoryController>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueAccent.withOpacity(.8),
            title: Text(
              "Categories",
              style: NewsText.textMainH,
            ),
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blueAccent.withOpacity(0.2), // Drawer background color
              child: ListView.builder(
                itemCount: provider.categorylist.length + 1, // +1 for the divider
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Display a divider before the categories start
                    return Divider(
                      height: 1,
                      color: Colors.black,
                    );
                  }
                  return ListTile(
                    title: Text(
                      provider.categorylist[index - 1], // Adjust index for categories
                      style: TextStyle(
                        color: Colors.black, // Text color for categories
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      provider.onTap(index: index - 1); // Adjust index for onTap
                      Navigator.pop(context); // Close the drawer
                    },
                  );
                },
              ),
            ),
          ),
          body: provider.isLoading
              ? Center(
            child: LottieBuilder.asset(
              "assets/animation/newsload.json",
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' ${provider.category}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                      title: provider.newsModel.articles?[index].title ?? "",
                      description: provider.newsModel.articles?[index].description ?? "",
                      date: provider.newsModel.articles?[index].publishedAt,
                      imageUrl: provider.newsModel.articles?[index].urlToImage ?? "",
                      contant: provider.newsModel.articles?[index].content ?? "",
                      sourceName: provider.newsModel.articles?[index].source?.name ?? "",
                      url: provider.newsModel.articles?[index].url ?? "",
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 20,
                    ),
                    itemCount: provider.newsModel.articles?.length ?? 0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
