import 'package:audible_news/controller/news_controller.dart';
import 'package:audible_news/model/news.dart';
import 'package:audible_news/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsBuilder extends StatelessWidget {
  NewsBuilder({this.type, this.textAlign});

  final NewsController _newsController = NewsController();
  final TextAlign? textAlign;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: _newsController.getNews(type!),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? NewsList(snapshot.data!.articles, textAlign)
            : snapshot.hasError
                ? Center(child: Text(snapshot.error as String))
                : SpinKitCubeGrid(color: Theme.of(context).primaryColor, size: 36.0);
      },
    );
  }
}
