import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/Helpers/constants.dart';

class ContactMe extends StatefulWidget {
  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController subjectEditingController = TextEditingController();
  TextEditingController messageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "Contact Me",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.white,
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     colorFilter: new ColorFilter.mode(
        //         Colors.black.withOpacity(0.4), BlendMode.darken),
        //     image: NetworkImage(bgImgUrl),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        color: Color(0xff333340),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "I am ready for Freelance Work and Collaborations",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                maxLines: 1,
                controller: nameEditingController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 1,
                controller: emailEditingController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 2,
                controller: subjectEditingController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Subject",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 5,
                controller: messageEditingController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("forms")
                      .doc(uploadTime)
                      .set({
                    'name': nameEditingController.text,
                    'email': emailEditingController.text,
                    'subject': subjectEditingController.text,
                    'message': messageEditingController.text,
                    'uploadTime': uploadTime
                  }).catchError((onError) {
                    print(onError);
                  }).whenComplete(() {
                    setState(() {
                      nameEditingController.text = emailEditingController.text =
                          subjectEditingController.text =
                              messageEditingController.text = "";
                    });
                  });
                },
                height: 60,
                minWidth: double.infinity,
                color: Colors.white,
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
