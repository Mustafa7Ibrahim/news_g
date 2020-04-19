import 'package:audible_news/modils/article.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPost extends StatefulWidget {
  final Article article;
  NewsPost({this.article});

  @override
  _NewsPostState createState() => _NewsPostState();
}

class _NewsPostState extends State<NewsPost> {
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(43, 43, 43, 1),
      body: SafeArea(
        child: ListView(
          controller: controller,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  child: Image.network(
                    widget.article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(14.0),
                    child: Text(
                      widget.article.author,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(14.0),
                  child: Text(
                    widget.article.publishedAt.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(43, 43, 43, 1),
              ),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
                    child: Text(
                      widget.article.title,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0),
                    child: Text(
                      widget.article.content,
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
