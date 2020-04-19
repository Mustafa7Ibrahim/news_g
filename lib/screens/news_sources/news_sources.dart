import 'package:audible_news/modils/news.dart';
import 'package:audible_news/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsSources extends StatefulWidget {
  @override
  _NewsSourcesState createState() => _NewsSourcesState();
}

class _NewsSourcesState extends State<NewsSources> {
  Future<News> getNews;

  @override
  void initState() {
    super.initState();
    getNews = getListOfUsNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<News>(
          future: getNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Text(
                snapshot.data.totalResults.toString(),
                style: TextStyle(color: Colors.white),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text(snapshot.error);
            }
            return SpinKitCubeGrid(
              color: Theme.of(context).primaryColor,
              size: 36.0,
            );
          },
        ),
      ),
    );
  }
}
