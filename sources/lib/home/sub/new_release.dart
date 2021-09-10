import 'package:flutter/material.dart';

class NewRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            "New Release",
            style: TextStyle(
                fontSize: 10,
                letterSpacing: 0.5,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        // ListRecommend(),
      ],
    );
  }
}
