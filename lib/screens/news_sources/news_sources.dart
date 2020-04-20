import 'package:audible_news/modils/sources.dart';
import 'package:audible_news/screens/news_sources/sources_list.dart';
import 'package:audible_news/services/sources_serv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsSources extends StatefulWidget {
  @override
  _NewsSourcesState createState() => _NewsSourcesState();
}

class _NewsSourcesState extends State<NewsSources> {
  Future<ListOfSources> getSources;

  @override
  void initState() {
    super.initState();
    getSources = getSourcesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sources',
          style: GoogleFonts.amiri(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<ListOfSources>(
          future: getSources,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return SourcesList(sourcesList: snapshot.data.sources);
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text(snapshot.error);
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
