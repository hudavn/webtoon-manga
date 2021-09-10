import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sources/pre_watching/pre_watching.dart';

class singleRecommend extends StatelessWidget {
  singleRecommend({
    required this.ref,
    required this.genre,
    required this.title,
    required this.like,
    required this.author,
    required this.descr,
  });

  final String ref, genre, title, like, author, descr;

  @override
  Widget build(BuildContext context) {
    var theImage = Image.network(
      ref,
      fit: BoxFit.fitHeight,
    );
    precacheImage(theImage.image, context);

    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 50,
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
        child: Row(
          children: <Widget>[
            Ink(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: FadeInImage(
                  placeholder: AssetImage("assets/images/logo2.png"),
                  image: theImage.image,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        genre,
                        style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                        // textAlign: TextAlign.left,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Container(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
