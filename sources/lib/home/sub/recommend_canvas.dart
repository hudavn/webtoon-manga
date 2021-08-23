import 'package:flutter/material.dart';

class RecommendCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.black26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Text(
              "Recommended Series",
              style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 0.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListRecommend(),
        ],
      ),
    );
  }
}

class ListRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test2.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test3.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test4.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test5.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test6.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test3.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test4.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test2.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test6.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test5.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test2.jpg", fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset("assets/images/test3.jpg", fit: BoxFit.fitHeight),
          ),
        ],
      ),
    );
  }
}
