import 'package:audible_news/view/wrapper.dart';
import 'package:flutter/material.dart';

import 'constant/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Wrapper(),
    );
  }
}
