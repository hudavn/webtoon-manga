import 'package:flutter/material.dart';
import 'package:sources/search/search.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0x8A000000),
      // child: IntrinsicHeight(
        // color: Color(0x8A000000),
        child: Text(
          "WEBTOON\nMANGA",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Pacifico",
              fontSize: 7,
              color: Colors.green[400],
              letterSpacing: 4,
              fontWeight: FontWeight.bold),
        ),
      // ),
    );
  }
}
