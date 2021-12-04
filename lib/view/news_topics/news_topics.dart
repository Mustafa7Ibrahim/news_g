import 'package:audible_news/bloc/news_cubit/news_cubit.dart';
import 'package:audible_news/core/constant/constant.dart';
import 'package:audible_news/repository/news_repository/news_repository.dart';
import 'package:audible_news/view/news_headline/components/news_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../injection_container.dart';

class NewsTopics extends StatefulWidget {
  @override
  _NewsTopicsState createState() => _NewsTopicsState();
}

class _NewsTopicsState extends State<NewsTopics> {
  TabController tabController;

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
            BlocProvider(
              create: (context) => NewsCubit(getIt<NewsRepository>())..getNews(APPLE_NEWS),
              child: NewsBuilder(textAlign: TextAlign.end),
            ),
            BlocProvider(
              create: (context) => NewsCubit(getIt<NewsRepository>())..getNews(BITCOIN_NEWS),
              child: NewsBuilder(textAlign: TextAlign.end),
            ),
            BlocProvider(
              create: (context) => NewsCubit(getIt<NewsRepository>())..getNews(WSJ_NEWS),
              child: NewsBuilder(textAlign: TextAlign.end),
            ),
          ],
        ),
      ),
    );
  }
}
