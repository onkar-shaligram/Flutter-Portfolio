import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  
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
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(child: Text("About Me", style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
              child: Container(
        // decoration: BoxDecoration(
        //   color: Colors.black,
        //   image: DecorationImage(
        //     colorFilter: new ColorFilter.mode(
        //         Colors.black.withOpacity(0.4), BlendMode.darken),
        //     image: NetworkImage(bgImgUrl),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        color: Color(0xff333340),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                //color: Colors.black,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Hi,", style: TextStyle(fontSize: 120, color: Colors.white, fontWeight: FontWeight.w500),),
                    ),
                    SizedBox(width: 800,),
                    Container(
                      child: Image.network("https://raw.githubusercontent.com/onkar-shaligram/onkar-shaligram/master/prog.gif", height: 300, width: 300,)),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: Text("I'm Onkar Shaligram, a 19-year-old undergrad, currently living in Bhopal (MP), India. Originally from Pune (MH), India.", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500), )
                ),
                SizedBox(height: 10,),

                Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: Text("I am a programmer with intermidiate knowledge of front-end & back-end techniques. I love spending time on fixing little details and optimizing web apps. Also I like working in a team, as you learn faster and much more. As the saying goes:  Two heads are better than one.!!'.", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500), )
                ),

                SizedBox(height: 10,),
              
                Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: Text("I will be earning a degree in Bachelor of Technology in Computer Science from VIT Bhopal University probably in 2023.", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500), )
                ),
                
                SizedBox(height: 10,),

                 Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: Text("If you wish to connect with me, then find me at Twitter, Linkedin and also on Github.", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),)
                ),

                SizedBox(height: 10,),
                
                Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    launchUrl("https://rzp.io/l/4l0UoiD");
                  },
                  child: Text("Did you like the website? or got inspired? or copied the theme? No problem! Just buy me a starbucks and make me happy!!!.", style: TextStyle(fontSize: 26, color: Colors.red, fontWeight: FontWeight.w500),))
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}
