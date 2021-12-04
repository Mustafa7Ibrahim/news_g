import 'package:audible_news/bloc/source_cubit/source_cubit.dart';
import 'package:audible_news/injection_container.dart';
import 'package:audible_news/view/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constant/constant.dart';
import 'repository/news_repository/news_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: BlocProvider(
        create: (context) => SourceCubit(getIt<NewsRepository>())..getSources(),
        child: Wrapper(),
      ),
    );
  }
}
