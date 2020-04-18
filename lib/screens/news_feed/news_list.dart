import 'package:audible_news/modils/articles.dart';
import 'package:flutter/material.dart';

import 'news_article.dart';

class NewsList extends StatelessWidget {
  final List<Articles> newsList;
  NewsList(this.newsList);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsArticle(article: newsList[index]);
      },
    );
  }
}
