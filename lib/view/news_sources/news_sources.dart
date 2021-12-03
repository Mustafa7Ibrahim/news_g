import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/controller/news_controller.dart';
import 'package:audible_news/model/sources.dart';
import 'package:audible_news/view/news_sources/components/sources_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NewsSources extends StatefulWidget {
  @override
  _NewsSourcesState createState() => _NewsSourcesState();
}

class _NewsSourcesState extends State<NewsSources> {
  NewsController _newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Sources'),
        centerTitle: true,
      ),
      body: FutureBuilder<ListOfSources>(
        future: _newsController.getSources(SOURCES),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SourcesList(sourcesList: snapshot.data!.sources);
          } else if (snapshot.hasError) {
            return Text(snapshot.error as String);
          }
          return Center(child: NeumorphicProgressIndeterminate());
        },
      ),
    );
  }
}
