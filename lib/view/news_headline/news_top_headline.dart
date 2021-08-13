import 'package:audible_news/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'components/news_builder.dart';

class NewsTopHeadLine extends StatefulWidget {
  @override
  _NewsTopHeadLineState createState() => _NewsTopHeadLineState();
}

class _NewsTopHeadLineState extends State<NewsTopHeadLine> {
  int _selectedIndex = 0;

  List<Widget> widgets() => [
        NewsBuilder(textAlign: TextAlign.start, type: US_NEWS),
        NewsBuilder(textAlign: TextAlign.end, type: EG_NEWS),
      ];

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text('Top HeadLine'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: NeumorphicToggle(
                selectedIndex: _selectedIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                    print("_firstSelected: $_selectedIndex");
                  });
                },
                displayForegroundOnlyIfSelected: true,
                thumb: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                children: [
                  ToggleElement(
                    foreground: Center(
                      child: Text(
                        'US_NEWS',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    background: Center(
                      child: Text(
                        "US_NEWS",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  ToggleElement(
                    foreground: Center(
                      child: Text(
                        'EG_NEWS',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    background: Center(
                      child: Text(
                        "EG_NEWS",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: widgets().elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}
