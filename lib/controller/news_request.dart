import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/components/api.dart';
import 'package:news/model/article/article.dart';

class   NewsApi extends ChangeNotifier {
  bool isLoading = true;
  List<Article> articles = [];
  Future<List<Article>> getnews() async {
    isLoading = true;
    final response = await http.get(Uri.parse(Api.endpointurl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      isLoading = false;

      notifyListeners();
      isLoading = false;
      return articles;
    } else {
      throw ("cant get the Article");
    }
  }
}