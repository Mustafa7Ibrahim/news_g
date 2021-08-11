import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/view/news_headline/components/news_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTopics extends StatefulWidget {
  @override
  _NewsTopicsState createState() => _NewsTopicsState();
}

class _NewsTopicsState extends State<NewsTopics> {
  TabController? tabController;

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
              textStyle: TextStyle(color: Colors.white, fontSize: 24.0),
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
            NewsBuilder(textAlign: TextAlign.end, type: APPLE_NEWS),
            NewsBuilder(textAlign: TextAlign.end, type: BITCOIN_NEWS),
            NewsBuilder(textAlign: TextAlign.end, type: WSJ_NEWS),
          ],
        ),
      ),
    );
  }
}
