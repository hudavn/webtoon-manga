
import 'package:flutter/material.dart';
import 'package:sources/home/sub/bottom_navigation_bar.dart';

class MySeriesScreen extends StatelessWidget {
  const MySeriesScreen({required this.currentIndex, required this.onTabTapped});

  final int currentIndex;
  final void Function(int id) onTabTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x8A000000),
      appBar: AppBar(
        backgroundColor: Color(0x8A000000),
        bottomOpacity: 0,
        elevation: 0,
        title: Text(
          "MY SERIES",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey,
            thickness: 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hi, we are the development team of Webtoon Manga\n\nThis is currently still in development\n\nSorry for the inconvenience!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          )
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
