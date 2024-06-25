import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/Controller/searchscreenController.dart';
import 'package:newsapp/Utils/textTheme.dart';
import 'package:newsapp/widget/newscard.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * 2 / 3,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.blueAccent.withOpacity(.8),
                                width: 3))),
                  ),
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          provider.searchData(
                              searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Colors.blueAccent.withOpacity(.8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the border radius here
                            ),
                          ),
                        ),
                        child: const Text(
                          "Search",
                          style:
                          TextStyle(color: Colors.white),
                        )))
              ],
            ),
            Expanded(
              child: Provider.of<SearchScreenController>(context).isLoading ==
                      true
                  ? Center(
                      child: LottieBuilder.asset(
                          "assets/animation/newsload.json",
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150))
                  : ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                            title: provider.newsModel?.articles?[index].title
                                    .toString() ??
                                "",
                            description: provider
                                    .newsModel?.articles?[index].description
                                    .toString() ??
                                "",
                            date: provider
                                .newsModel?.articles?[index].publishedAt,
                            imageUrl: provider
                                    .newsModel?.articles?[index].urlToImage
                                    .toString() ??
                                "",
                            contant: provider
                                    .newsModel?.articles?[index].content
                                    .toString() ??
                                "",
                            sourceName: provider
                                    .newsModel?.articles?[index].source?.name
                                    .toString() ??
                                "",
                            url: provider.newsModel?.articles?[index].url
                                    .toString() ??
                                "",
                          ),
                      separatorBuilder: (context, index) => const Divider(
                            height: 20,
                          ),
                      itemCount: provider.newsModel?.articles?.length ?? 0),
            )
          ],
        ),
      )),
    );
  }
}
