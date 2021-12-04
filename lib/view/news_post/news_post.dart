import 'package:audible_news/models/article.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPost extends StatefulWidget {
  final Article article;
  final textAlign;
  NewsPost({this.article, this.textAlign});

  @override
  _NewsPostState createState() => _NewsPostState();
}

class _NewsPostState extends State<NewsPost> {
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                  height: height * 0.4,
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
                Container(
                  width: width,
                  height: height * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(14.0),
                          child: Text(
                            widget.article.source.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 12.0, bottom: 4.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.open_in_browser,
                            color: Colors.white,
                            size: 36.0,
                          ),
                          onPressed: () => launchUrl(),
                        ),
                      ),
                    ],
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
                      textAlign: widget.textAlign,
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
                      textAlign: widget.textAlign,
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchUrl() async {
    var url = widget.article.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }
}
