import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sources/pre_watching/pre_watching.dart';

class singleRecommend extends StatelessWidget {
  singleRecommend(
      {required this.ref,
      required this.genre,
      required this.title,
      required this.like,
      required this.descr,
      required this.author});

  final String ref, genre, title, like, author, descr;

  @override
  Widget build(BuildContext context) {
    var theImage = Image.network(ref);

    precacheImage(theImage.image, context);

    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PreWatching(
                        ref: ref,
                        title: title,
                        genre: genre,
                        descr: descr,
                        author: author,
                      )));
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Ink(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: FadeInImage(
                  placeholder: AssetImage("assets/images/logo2.png"),
                  image: theImage.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                width: 100,
                child: Text(
                  genre,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, left: 10),
                width: 100,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
            Positioned(
              top: 12,
              right: 10,
              child: Row(
                children: [
                  Text(
                    like,
                    style: TextStyle(fontSize: 9, color: Colors.black),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red[500],
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
