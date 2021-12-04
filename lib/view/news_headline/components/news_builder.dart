import 'package:audible_news/bloc/news_cubit/news_cubit.dart';
import 'package:audible_news/view/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsBuilder extends StatelessWidget {
  NewsBuilder({this.textAlign});

  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return SpinKitCubeGrid(color: Theme.of(context).colorScheme.primary, size: 36.0);
        } else if (state is NewsLoaded) {
          return NewsList(state.news.articles, textAlign);
        } else if (state is NewsError) {
          Center(child: Text(state.error));
        }
        return Container();
      },
    );
  }
}
