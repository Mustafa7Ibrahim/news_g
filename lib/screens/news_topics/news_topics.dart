import 'package:audible_news/modils/news.dart';
import 'package:audible_news/screens/news/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTopics extends StatefulWidget {
  @override
  _NewsTopicsState createState() => _NewsTopicsState();
}

class _NewsTopicsState extends State<NewsTopics> {
  TabController tabController;

  ScrollController scrollController;

  Future<News> getUsNews;

  Future<News> getEgNews;

  Future<News> getDeNews;

  // @override
  // void initState() {
  //   super.initState();
  //   getUsNews = getListOfUsNews();
  //   getEgNews = getListOfEgNews();
  //   getDeNews = getListOfDeNews();
  // }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Topics',
            style: GoogleFonts.amiri(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            controller: tabController,
            tabs: [
              Tab(text: '#Us_News'),
              Tab(text: '#Egypt_News'),
              Tab(text: '#Germany_News'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder<News>(
                future: getUsNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return NewsList(snapshot.data.articles, TextAlign.start);
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
            Center(
              child: FutureBuilder<News>(
                future: getEgNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return NewsList(snapshot.data.articles, TextAlign.end);
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
            Center(
              child: FutureBuilder<News>(
                future: getDeNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return NewsList(snapshot.data.articles, TextAlign.start);
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
          ],
        ),
      ),
    );
  }
}
