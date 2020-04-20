import 'package:audible_news/screens/news_everything/news_everything.dart';
import 'package:audible_news/screens/news_feed/news_top_headline.dart';
import 'package:audible_news/screens/news_sources/news_sources.dart';
import 'package:audible_news/screens/search/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
      icon: Icons.fiber_smart_record,
      title: 'Feed',
      backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
    TitledNavigationBarItem(
      icon: Icons.all_inclusive,
      title: 'EveryThing',
      backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
    TitledNavigationBarItem(
      icon: Icons.ac_unit,
      title: 'Sources',
      backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
    TitledNavigationBarItem(
      icon: Icons.search,
      title: 'Search',
      backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
  ];

  final List<Widget> widgetOptions = [
    NewsTopHeadLine(),
    NewsEveryThing(),
    NewsSources(),
    Search(),
  ];

  bool navBarMode = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) => setState(() => selectedIndex = index),
        items: items,
        activeColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        curve: Curves.ease,
        inactiveColor: Colors.white,
        inactiveStripColor: Color.fromRGBO(43, 43, 43, 1),
        reverse: navBarMode,
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
