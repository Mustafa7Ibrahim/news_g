import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import 'news_headline/news_top_headline.dart';
import 'news_sources/news_sources.dart';
import 'news_topics/news_topics.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  final List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.fiber_smart_record),
      title: 'Headlines',
      // backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.all_inclusive),
      title: 'Topics',
      // backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.ac_unit),
      title: 'Sources',
      // backgroundColor: Color.fromRGBO(43, 43, 43, 1),
    ),
  ];

  final List<Widget> widgetOptions = [
    NewsTopHeadLine(),
    NewsTopics(),
    NewsSources(),
  ];

  bool navBarMode = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: widgetOptions,
        controller: _controller,
        hideNavigationBar: _hideNavBar,
        items: items,
        neumorphicProperties: NeumorphicProperties(),
        navBarStyle: NavBarStyle.neumorphic,
      ),
      // body: widgetOptions.elementAt(selectedIndex),

      // TitledBottomNavigationBar(
      //   onTap: (index) => setState(() => selectedIndex = index),
      //   items: items,
      //   activeColor: Theme.of(context).primaryColor,
      //   currentIndex: selectedIndex,
      //   curve: Curves.ease,
      //   inactiveColor: Colors.white,
      //   inactiveStripColor: Color.fromRGBO(43, 43, 43, 1),
      //   reverse: navBarMode,
      //   indicatorColor: Theme.of(context).primaryColor,
      // ),
    );
  }
}
