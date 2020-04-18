import 'dart:convert';

import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/modils/articles.dart';
import 'package:http/http.dart' as http;

class News {
  List<Articles> list = [];

  Future<List<Articles>> getNews({String about, String country}) async {
    String url =
        'https://newsapi.org/v2/$about?country=$country&apiKey=$apiKey';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        Articles articles = Articles(
          title: article['title'] ?? '',
          author: article['author'] ?? '',
          description: article['description'] ?? '',
          url: article['url'] ?? '',
          urlToImage: article['urlToImage'] ?? '',
          content: article['content'] ?? '',
          publishedAt: DateTime.parse(
            article['publishedAt'] ?? '',
          ),
        );
        list.add(articles);
      });
    }
    return list;
  }
}
