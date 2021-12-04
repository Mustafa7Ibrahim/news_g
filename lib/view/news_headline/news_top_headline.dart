import 'package:audible_news/bloc/news_cubit/news_cubit.dart';
import 'package:audible_news/core/constant/constant.dart';
import 'package:audible_news/injection_container.dart';
import 'package:audible_news/repository/news_repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/news_builder.dart';

class NewsTopHeadLine extends StatefulWidget {
  @override
  _NewsTopHeadLineState createState() => _NewsTopHeadLineState();
}

class _NewsTopHeadLineState extends State<NewsTopHeadLine> {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Top HeadLine',
            style: GoogleFonts.amiri(
              textStyle: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            controller: tabController,
            tabs: [Tab(text: '#Us_News'), Tab(text: '#Egypt_News')],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BlocProvider(
              create: (context) => NewsCubit(getIt<NewsRepository>())..getNews(US_NEWS),
              child: NewsBuilder(textAlign: TextAlign.start),
            ),
            BlocProvider(
              create: (context) => NewsCubit(getIt<NewsRepository>())..getNews(EG_NEWS),
              child: NewsBuilder(textAlign: TextAlign.end),
            ),
          ],
        ),
      ),
    );
  }
}
