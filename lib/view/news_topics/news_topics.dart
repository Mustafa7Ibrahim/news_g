import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/view/news_headline/components/news_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NewsTopics extends StatefulWidget {
  @override
  _NewsTopicsState createState() => _NewsTopicsState();
}

class _NewsTopicsState extends State<NewsTopics> {
  int _selectedIndex = 0;
  List<Widget> tabs() {
    return [
      NewsBuilder(textAlign: TextAlign.start, type: APPLE_NEWS),
      NewsBuilder(textAlign: TextAlign.start, type: BITCOIN_NEWS),
      NewsBuilder(textAlign: TextAlign.start, type: WSJ_NEWS),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text('Topics'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: NeumorphicToggle(
                selectedIndex: _selectedIndex,
                onChanged: (value) {
                  setState(() => _selectedIndex = value);
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
                        'Apple',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    background: Center(
                      child: Text(
                        "Apple",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  ToggleElement(
                    foreground: Center(
                      child: Text(
                        'Bitcoin',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    background: Center(
                      child: Text(
                        "Bitcoin",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  ToggleElement(
                    foreground: Center(
                      child: Text(
                        'WSJ & NT',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    background: Center(
                      child: Text(
                        "WSJ & NT",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: tabs().elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}
