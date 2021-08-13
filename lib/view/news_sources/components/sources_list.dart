import 'package:audible_news/model/sources.dart';
import 'package:audible_news/view/news_sources/components/source_item.dart';
import 'package:flutter/material.dart';

class SourcesList extends StatelessWidget {
  final List<Sources>? sourcesList;
  SourcesList({required this.sourcesList});
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      itemCount: sourcesList!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        return SourceItem(sources: sourcesList![index]);
      },
    );
  }
}
