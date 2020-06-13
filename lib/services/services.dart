import 'dart:convert';

import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/modils/news.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';

// headline
Future<News> getListOfUsNews() async {
  final response = await http
      .get('https://newsapi.org/v2/$topHeadline?country=$us&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}

Future<News> getListOfEgNews() async {
  final response = await http
      .get('https://newsapi.org/v2/$topHeadline?country=$eg&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}

Future<News> getListOfDeNews() async {
  final response = await http
      .get('https://newsapi.org/v2/$topHeadline?country=$de&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}

// topics
Future<News> getBitcoinNews() async {
  final response = await http
      .get('https://newsapi.org/v2/everything?q=bitcoin&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}

Future<News> getAppleNews() async {
  final response = await http.get(
      'https://newsapi.org/v2/everything?q=apple&from=2020-06-12&to=2020-06-12&sortBy=popularity&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}

Future<News> getWSJNews() async {
  final response = await http.get(
      'https://newsapi.org/v2/everything?domains=wsj.com,nytimes.com&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}
