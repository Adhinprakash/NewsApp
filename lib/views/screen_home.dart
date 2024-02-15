import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/components/const.dart';
import 'package:news/controller/news_request.dart';
import 'package:news/views/widgets/news_widgets.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsApi>(context,listen: false).getnews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        // leading: Icon(CupertinoIcons.back),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Google",style: textStyleFuc(weight: FontWeight.w300, color: Colors.black, size: 17),),Text("News",style: TextStyle(color: Colors.blue,fontSize: 17),)],
        ),
        
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
    Consumer<NewsApi>(
      builder: (context,newsnotifier,child){
    final article = newsnotifier.articles;
                    if (newsnotifier.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }else{
                          return SizedBox(
                        height: 800,
                        width: 600,
                        child: ListView.builder(
                          
                          itemCount: article.length,
                          itemBuilder: (context, index) {
                            return NewslistWidget(
                              title: article[index].title,
                              image: article[index].urlToImage,
                              desc: article[index].description,
                            );
                          },
                        ),
                      );
                    }
      },
      
    )
        ],
      ),
    ),);
  }
}