import 'package:audible_news/modils/sources.dart';
import 'package:audible_news/screens/news_sources/source_item.dart';
import 'package:flutter/material.dart';

class SourcesList extends StatelessWidget {
  final List<Sources> sourcesList;
  SourcesList({@required this.sourcesList});
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      itemCount: sourcesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      ),
      itemBuilder: (context, index) {
        return SourceItem(sources: sourcesList[index]);
      },
    );
  }
}
