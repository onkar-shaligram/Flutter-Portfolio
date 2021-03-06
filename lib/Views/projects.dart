import 'package:flutter/material.dart';
import 'package:flutter_portfolio/Helpers/Media_query.dart';
import 'package:flutter_portfolio/Helpers/projectView.dart';
import 'package:flutter_portfolio/Helpers/projects_helper.dart';

class Projects extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "Projects",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.white,
      ),

      body: MediaQuerys(
        largeScreen: Container(
        decoration: BoxDecoration(
          color: Color(0xff333340),
        ),
        child: GridView.count(
            padding: EdgeInsets.all(16.0),
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.3),
            children: List.generate(
                projects.length, (index) => ProjectView(project: projects[index],)),
          ),
      ),

      mediumScreen: Container(
        decoration: BoxDecoration(
          color: Color(0xff333340),
        ),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) => ProjectView(
            project: projects[index],
          )
        )
        ),

        
       smallScreen: Container(
        decoration: BoxDecoration(
          color: Color(0xff333340),
        ),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) => ProjectView(
            project: projects[index],
          )
        )
        ),
    ),
    );
  }
}