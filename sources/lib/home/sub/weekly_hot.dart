import 'package:flutter/material.dart';
import 'recommend_canvas.dart';

class WeeklyHot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            "Weekly HOT",
            style: TextStyle(
                fontSize: 10,
                letterSpacing: 0.5,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        ListRecommend(),
      ],
    );
  }
}
