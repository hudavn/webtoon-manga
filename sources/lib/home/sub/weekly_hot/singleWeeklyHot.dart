import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sources/pre_watching/pre_watching.dart';

class singleRecommend extends StatelessWidget {
  singleRecommend(
      {required this.ref,
      required this.genre,
      required this.title,
      required this.like,
      required this.index,
      required this.author,
      required this.descr});

  final String ref, genre, title, like, index, author, descr;

  @override
  Widget build(BuildContext context) {
    var theImage = Image.network(
      ref,
      fit: BoxFit.fitHeight,
    );
    precacheImage(theImage.image, context);

    return Container(
      margin: index != '1' ? EdgeInsets.only(top: 10) : EdgeInsets.all(0),
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
            Container(
              width: 30,
              child: Center(
                child: index != "1"
                    ? Text(
                        index,
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      )
                    : Stack(alignment: Alignment.center, children: [
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.green[500],
                        ),
                        Text(
                          index,
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.bold),
                        )
                      ]),
              ),
            ),
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
