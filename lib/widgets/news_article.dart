import 'package:audible_news/model/article.dart';
import 'package:audible_news/view/news_post/news_post.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsArticle extends StatelessWidget {
  final Article article;
  final textAlign;
  NewsArticle({this.article, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsPost(
            article: article,
            textAlign: textAlign,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 12.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(43, 43, 43, 1),
        ),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: width,
              height: 250.0,
              child: Image.network(
                article?.urlToImage ??
                    'https://i.picsum.photos/id/1015/6000/4000.jpg?hmac=aHjb0fRa1t14DTIEBcoC12c5rAXOSwnVlaA5ujxPQ0I',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
              child: Text(
                article.title,
                textAlign: textAlign,
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
                article.description,
                textAlign: textAlign,
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 12.0,
                      top: 8.0,
                      bottom: 8.0,
                      right: 12.0,
                    ),
                    child: Text(
                      article.author,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 12.0,
                    top: 8.0,
                    bottom: 8.0,
                    right: 12.0,
                  ),
                  child: Text(
                    article.publishedAt.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
