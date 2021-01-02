import 'package:flutter/material.dart';
import 'package:flutter_portfolio/Helpers/project_class.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectView extends StatelessWidget {
  Project project;
  ProjectView({this.project});

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(18.0),
      child: InkWell(
        onTap: () {
          launchUrl(project.link);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 40,
                  child: Image.network(
                    project.image,
                    width: 25,
                    height: 25,
                  )),
              Expanded(
                flex: 3,
                child: Container(),
              ),
              Expanded(
                flex: 60,
                child: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        project.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        project.description,
                        textScaleFactor: 1.2,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
