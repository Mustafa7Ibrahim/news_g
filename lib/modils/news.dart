import 'package:audible_news/modils/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  String status;
  int totalResults;
  List<Article> articles;

  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
          json["articles"].map((x) => Article.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

// Future<void> getNews(String url, List list) async {
//   var response = await http.get(url);

//   var jsonData = jsonDecode(response.body);

//   if (jsonData['status'] == 'ok') {
//     jsonData['articles'].forEach((article) {
//       Articles articles = Articles(
//         title: article['title'] ?? '',
//         author: article['author'] ?? '',
//         description: article['description'] ?? '',
//         url: article['url'] ?? '',
//         urlToImage: article['urlToImage'] ?? '',
//         content: article['content'] ?? '',
//         publishedAt: DateTime.parse(
//           article['publishedAt'] ?? '',
//         ),
//       );
//       list.add(articles);
//     });
//   }
// }

// Future<void> getUsNews() {
//   String url = 'https://newsapi.org/v2/$topHeadline?country=$us&apiKey=$apiKey';
//   return getNews(url, usList);
// }

// Future getEgNews() {
//   String url =
//       'https://newsapi.org/v2/$topHeadline?country=$egypt&apiKey=$apiKey';
//   return getNews(url, egyptList);
// }
