import 'package:audible_news/modils/news.dart';
import 'package:audible_news/screens/news_feed/news_list.dart';
import 'package:audible_news/services/services.dart';
import 'package:audible_news/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  TabController tabController;
  ScrollController scrollController;

  Future<News> getUsNews;
  Future<News> getEgNews;
  Future<News> getDeNews;

  @override
  void initState() {
    super.initState();
    getUsNews = getListOfUsNews();
    getEgNews = getListOfEgNews();
    getDeNews = getListOfDeNews();
  }

  @override
  void dispose() {
    tabController.dispose();
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
            'Feed',
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
              Tab(text: '#Us_News'),
              Tab(text: '#Egypt_News'),
              Tab(text: '#Germany_News'),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder<News>(
                future: getUsNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return NewsList(snapshot.data.articles);
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
                    return NewsList(snapshot.data.articles);
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
                    return NewsList(snapshot.data.articles);
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
