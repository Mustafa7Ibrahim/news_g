import 'package:audible_news/models/sources.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceItem extends StatelessWidget {
  final Sources sources;
  SourceItem({@required this.sources});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(),
      child: Card(
        color: Color.fromRGBO(43, 43, 43, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              sources.name,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Container(
              margin: EdgeInsets.only(right: 12.0, left: 12.0),
              child: Text(
                sources.description,
                maxLines: 4,
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.white54),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12.0, left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Category',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    sources.category,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12.0, left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'language',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    sources.language,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12.0, left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'country',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    sources.country,
                    style: TextStyle(color: Colors.white),
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
    var url = sources.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }
}
