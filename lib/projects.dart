import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text("Projects", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
    );
  }
}
