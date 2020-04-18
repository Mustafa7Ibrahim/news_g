import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/modils/news.dart';
import 'package:audible_news/screens/news_feed/news_list.dart';
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

  bool loadingInPregrass = false;
  var usNewsList;
  var egyptNewsList;

  void getNews() async {
    News news = News();
    final topEgyptNews = await news.getNews(country: egypt, about: topHeadline);
    final topUsNews = await news.getNews(country: us, about: everyThing);
    setState(() {
      loadingInPregrass = false;
      usNewsList = topUsNews;
      egyptNewsList = topEgyptNews;
    });
  }

  @override
  void initState() {
    loadingInPregrass = true;
    getNews();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              Tab(text: '#Us'),
              Tab(text: '#Egypt'),
            ],
          ),
        ),
        body: loadingInPregrass
            ? Center(
                child: SpinKitCubeGrid(
                  color: Theme.of(context).primaryColor,
                  size: 36.0,
                ),
              )
            : TabBarView(
                children: <Widget>[
                  NewsList(usNewsList),
                  NewsList(egyptNewsList),
                ],
              ),
      ),
    );
  }
}
