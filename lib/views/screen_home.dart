import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/components/const.dart';
import 'package:news/controller/news_request.dart';
import 'package:news/views/widgets/news_widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsApi>(context, listen: false).getnews();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Google",
              style: textStyleFuc(
                  weight: FontWeight.w300, color: Colors.black, size: 17),
            ),
            const Text(
              "News",
              style: TextStyle(color: Colors.blue, fontSize: 17),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<NewsApi>(
          builder: (context, newsnotifier, child) {
            final article = newsnotifier.articles;
            if (newsnotifier.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: screenHeight * 0.8,
                width: screenWidth * 0.99,
                child: ListView.builder(
                  itemCount: article.length,
                  itemBuilder: (context, index) {
                    final articles = article[index];
        
                    return NewslistWidget(
                      title: article[index].title,
                      image: article[index].urlToImage,
                      desc: article[index].description,
                      publishedAt: article[index].publishedAt,
                      souceName: articles.source!.name,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}