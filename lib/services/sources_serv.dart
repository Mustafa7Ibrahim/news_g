import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/modils/sources.dart';
import 'package:http/http.dart' as http;

Future<ListOfSources> getSourcesList() async {
  final response =
      await http.get('https://newsapi.org/v2/sources?apiKey=$apiKey');
  return sourcesFromJson(response.body);
}
