import 'package:audible_news/modils/news.dart';
import 'package:audible_news/services/services.dart';
import 'package:audible_news/widgets/news_list.dart';
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

  Future<News> getAppleListNews;

  Future<News> getBitCoinNews;

  Future<News> getWSJListNews;

  @override
  void initState() {
    super.initState();
    getAppleListNews = getAppleNews();
    getBitCoinNews = getBitcoinNews();
    getWSJListNews = getWSJNews();
  }

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
            labelColor: Colors.white,
            controller: tabController,
            tabs: [
              Tab(text: '#Apple'),
              Tab(text: '#Bitcoin'),
              Tab(text: '#WSJ & NT'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder<News>(
                future: getAppleListNews,
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
                future: getBitCoinNews,
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
                future: getWSJListNews,
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
