import 'dart:convert';

import 'package:audible_news/constant/constant.dart';
import 'package:audible_news/modils/news.dart';
import 'package:http/http.dart' as http;

Future<News> getListOfUsNews()async{
  final response = await http.get('https://newsapi.org/v2/$topHeadline?country=$us&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}
Future<News> getListOfEgNews()async{
  final response = await http.get('https://newsapi.org/v2/$topHeadline?country=$eg&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}
Future<News> getListOfDeNews()async{
  final response = await http.get('https://newsapi.org/v2/$topHeadline?country=$de&apiKey=$apiKey');
  final jsonData = jsonDecode(response.body);
  return News.fromJson(jsonData);
}

