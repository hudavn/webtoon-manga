import 'package:flutter/material.dart';
import 'sub/app_bar.dart';
import 'sub/recommend_canvas.dart';
import 'sub/bottom_navigation_bar.dart';
import 'sub/weekly_hot.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: HomeAppBar(),
          ),
          body: Container(
            color: Colors.black54,
            child: ListView(
              children: <Widget>[
                RecommendCanvas(),
                WeeklyHot(),
                WeeklyHot(),
              ],
            ),
          ),
          bottomNavigationBar: HomeBottomNavigationBar(),
        ),
        theme: ThemeData.dark());
  }
}
