import 'dart:convert';
import 'package:audible_news/model/news.dart';
import 'package:audible_news/model/sources.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NewsController with ChangeNotifier {
  Future<News> getNews(String type) async {
    final response = await http.get(type);
    final jsonData = jsonDecode(response.body);
    return News.fromJson(jsonData);
  }

  Future<ListOfSources> getSources(String url) async {
    final response = await http.get(url);
    return sourcesFromJson(response.body);
  }
}
