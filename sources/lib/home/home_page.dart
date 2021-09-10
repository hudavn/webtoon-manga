import 'package:flutter/material.dart';
import 'package:sources/home/sub/fresh_pick/fresh_pick.dart';
import 'package:sources/search/search.dart';
import 'sub/logo_app_bar.dart';
import 'sub/recommend_canvas/recommend_canvas.dart';
import 'sub/bottom_navigation_bar.dart';
import 'sub/weekly_hot/weekly_hot.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.currentIndex, required this.onTabTapped});

  final int currentIndex;
  final void Function(int id) onTabTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x8A000000),
        bottomOpacity: 0,
        elevation: 40,
        title: IntrinsicHeight(
          child: Row(
            children: [
              Logo(),
              VerticalDivider(
                thickness: 1.2,
                color: Colors.white10,
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Text("Genres",
              //       style: TextStyle(
              //           fontSize: 13.5,
              //           color: Colors.white30,
              //           letterSpacing: 1,
              //           fontWeight: FontWeight.bold)),
              // ),
            ],
          ),
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0x8A000000),
        child: ListView(
          children: <Widget>[
            RecommendCanvas(),
            WeeklyHot(),
            FreshPick(),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
