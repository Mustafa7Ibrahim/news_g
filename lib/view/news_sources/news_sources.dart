import 'package:audible_news/bloc/source_cubit/source_cubit.dart';
import 'package:audible_news/view/news_sources/components/sources_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsSources extends StatefulWidget {
  @override
  _NewsSourcesState createState() => _NewsSourcesState();
}

class _NewsSourcesState extends State<NewsSources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sources',
          style: GoogleFonts.amiri(
            textStyle: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<SourceCubit, SourceState>(
          builder: (context, state) {
            if (state is SourceLoading) {
              return SpinKitCubeGrid(color: Theme.of(context).colorScheme.primary, size: 36.0);
            } else if (state is SourceLoaded) {
              return SourcesList(sourcesList: state.listOfSources.sources);
            } else if (state is SourceError) {
              Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
