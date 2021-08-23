import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black45,
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                "WEBTOON\nMANGA",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 7,
                    color: Colors.white,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: VerticalDivider(
                indent: 15,
                endIndent: 15,
                thickness: 1.2,
                color: Colors.white10,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text("Genres",
                  style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.white30,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
    );
  }
}
