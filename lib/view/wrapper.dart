import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'news_headline/news_top_headline.dart';
import 'news_sources/news_sources.dart';
import 'news_topics/news_topics.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  List<Widget> widgetOptions() {
    return [
      NewsTopHeadLine(),
      NewsTopics(),
      NewsSources(),
    ];
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          widgetOptions().elementAt(selectedIndex),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: SafeArea(
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(12.0)),
                  ),
                  depth: selectedIndex == 0 ? -10.0 : 10.0,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 34.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() => selectedIndex = 0);
                      },
                      child: SizedBox(
                        width: size.width * 0.26,
                        height: size.height * 0.08,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.all(Radius.circular(12.0)),
                              ),
                              depth: selectedIndex == 0 ? -10.0 : 10.0,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.fiber_smart_record, size: 16.0),
                                Text(
                                  'Headlines',
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() => selectedIndex = 1);
                      },
                      child: SizedBox(
                        width: size.width * 0.26,
                        height: size.height * 0.08,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.all(Radius.circular(12.0)),
                              ),
                              depth: selectedIndex == 1 ? -10.0 : 10.0,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.all_inclusive, size: 16.0),
                                Text(
                                  'Topics',
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() => selectedIndex = 2);
                      },
                      child: SizedBox(
                        width: size.width * 0.26,
                        height: size.height * 0.08,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.all(Radius.circular(12.0)),
                              ),
                              depth: selectedIndex == 2 ? -10.0 : 10.0,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.ac_unit, size: 16.0),
                                Text(
                                  'Sources',
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
