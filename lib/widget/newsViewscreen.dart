import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Controller/homeScreenController.dart';
import 'package:newsapp/Utils/textTheme.dart';
import 'package:provider/provider.dart';

class NewsViewScreen extends StatelessWidget {
  const NewsViewScreen(
      {super.key,
      required this.title,
      required this.description,
      this.date,
      required this.imageUrl,
      required this.content,
      required this.sourceName,
      required this.url});

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withOpacity(.8),
        elevation: 0,
        iconTheme:
            IconThemeData(color: Colors.blueAccent.withOpacity(.8), size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: NewsText.textH,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 40 / 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            Text(
              description,
              style: NewsText.textDes,
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Text(
                content,
                style: NewsText.textCon,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Provider.of<HomeScreenController>(context, listen: false)
                      .launchURL(url);
                },
                child: Text(
                  "Click here to Read more....",
                  style: NewsText.textRdM,
                ))
          ],
        )),
      ),
    );
  }
}
