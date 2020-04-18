import 'package:audible_news/screens/news_feed/news_feed.dart';
import 'package:audible_news/screens/news_post/news_post.dart';
import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'screens/Wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/news_feed': (context) => NewsFeed(),
        '/news_post': (context) => NewsPost(),
      },
    );
  }
}
