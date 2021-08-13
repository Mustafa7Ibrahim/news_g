import 'package:audible_news/controller/news_controller.dart';
import 'package:audible_news/model/sources.dart';
import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/view/news_sources/components/sources_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Center(
        child: FutureBuilder<ListOfSources>(
          future: _newsController.getSources(SOURCES),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SourcesList(sourcesList: snapshot.data!.sources);
            } else if (snapshot.hasError) {
              return Text(snapshot.error as String);
            }
            return SpinKitCubeGrid(
              color: Theme.of(context).primaryColor,
              size: 36.0,
            );
          },
        ),
      ),
    );
  }
}
