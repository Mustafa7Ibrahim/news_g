import 'package:audible_news/bloc/news_cubit/news_cubit.dart';
import 'package:audible_news/repository/news_repository/news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'data_source/remote/http_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  getIt.registerFactory(() => NewsCubit(getIt()));

  // Use cases

  // Repository
  getIt.registerLazySingleton(() => NewsRepository(getIt()));

  // Data sources
  getIt.registerLazySingleton(() => HttpHelper(getIt()));

  //! Core

  //! External
  getIt.registerLazySingleton(() => Client());
}
