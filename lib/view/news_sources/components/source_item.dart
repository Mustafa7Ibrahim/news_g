import 'package:audible_news/model/sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceItem extends StatelessWidget {
  final Sources sources;
  SourceItem({required this.sources});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(),
      child: Neumorphic(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(sources.name!),
            Container(
              margin: EdgeInsets.only(right: 12.0, left: 12.0),
              child: Text(
                sources.description!,
                maxLines: 4,
                overflow: TextOverflow.clip,
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
                    ),
                  ),
                  Text(
                    sources.category!,
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
                    ),
                  ),
                  Text(
                    sources.language!,
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
                    ),
                  ),
                  Text(
                    sources.country!,
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
    var url = sources.url!;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }
}
