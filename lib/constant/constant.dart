import 'package:flutter/material.dart';

const String API_KEY = '54418b8e7605418d9ce121f9be84f407';
const String TOP_HEADLINE = 'top-headlines';
const String EVERYTHING = 'everything';

const String UNITED_STATES = 'us';
const String EGYPT = 'eg';
const String DEUTSCH = 'de';

const String US_NEWS =
    'https://newsapi.org/v2/$TOP_HEADLINE?country=$UNITED_STATES&apiKey=$API_KEY';
const String EG_NEWS = 'https://newsapi.org/v2/$TOP_HEADLINE?country=$EGYPT&apiKey=$API_KEY';

const String BITCOIN_NEWS = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=$API_KEY';
const String APPLE_NEWS = 'https://newsapi.org/v2/everything?q=apple&apiKey=$API_KEY';
const String WSJ_NEWS =
    'https://newsapi.org/v2/everything?domains=wsj.com,nytimes.com&apiKey=$API_KEY';

const String SOURCES = 'https://newsapi.org/v2/sources?apiKey=$API_KEY';

ThemeData theme = ThemeData(
  primarySwatch: Colors.red,
  accentColor: Colors.redAccent,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Color.fromRGBO(43, 43, 43, 1),
    elevation: 0.0,
    brightness: Brightness.dark,
  ),
);
