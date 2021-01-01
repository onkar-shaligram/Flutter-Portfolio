import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      //TODO
                    },
                    child: Text(
                      "About",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: () {
                      //TODO
                    },
                    child: Text(
                      "Projects",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: () {
                      //TODO
                    },
                    child: Text(
                      "Contact Me",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
            image: NetworkImage(bgImgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 150,
                backgroundImage: Image.network(myImgUrl).image,
              ),
              Text(
                "Onkar Shaligram",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              SizedBox(height: 20,),
              Text("Android Developer | Flutter Enthusiast", style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w600),),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.network(githubImgUrl)),
                    label: Text('Github', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      html.window.open("https://github.com/onkar-shaligram", "name");
                    },
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.network(twitterImgUrl)),
                    label: Text('Twitter', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      html.window.open(
                          "https://twitter.com/shaligram_onkar", "name");
                    },
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.network(linkedinImgUrl)),
                    label: Text('LinkedIn', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      html.window.open(
                          "https://www.linkedin.com/in/onkar-shaligram-a9799b190/",
                          "name");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
