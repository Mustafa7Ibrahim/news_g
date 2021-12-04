import 'package:audible_news/core/constant/constant.dart';
import 'package:audible_news/core/error/Failures.dart';
import 'package:audible_news/data_source/remote/http_helper.dart';
import 'package:audible_news/models/news.dart';
import 'package:audible_news/models/sources.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class NewsRepository {
  final HttpHelper httpHelper;

  NewsRepository(this.httpHelper);

  Future<Either<Failure, News>> getNews(String type) async {
    final Response response = await httpHelper.getData(type);
    if (response.statusCode == 200) {
      return Right(newsFromJson(response.body));
    } else {
      return Left(ServerFailure(response.reasonPhrase));
    }
  }

  Future<Either<Failure, ListOfSources>> getSources() async {
    final Response response = await httpHelper.getData(SOURCES);
    if (response.statusCode == 200) {
      return Right(sourcesFromJson(response.body));
    } else {
      return Left(ServerFailure(response.reasonPhrase));
    }
  }
}
