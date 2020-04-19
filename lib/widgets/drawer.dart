import 'package:audible_news/modils/news.dart';
import 'package:audible_news/screens/news_feed/news_feed.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: Color.fromRGBO(43, 43, 43, 1),
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            DrawerHeader(child: null),
            ListTile(
              title: Text(
                '#Top HeadLine',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/news_sources');
              },
            ),
            ListTile(
              title: Text(
                '#EveryThing',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'About a particular subject.',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ListTile(
              title: Text(
                '#Source',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
