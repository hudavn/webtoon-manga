import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sources/read/watching.dart';

class SingleChapter extends SingleChildScrollView {
  SingleChapter(
      {required this.title, required this.ref, required this.titleChapter});
  final String title, titleChapter, ref;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theImage = Image.network(ref);
    precacheImage(theImage.image, context);

    return Container(
      margin: EdgeInsets.only(bottom: 1),
      // padding: EdgeInsets.symmetric(vertical: 15),
      width: size.width,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
        )
      ]),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Watching(
                  title: title,
                  titleChapter: titleChapter,
                ),
              ));
        },
        child: Row(
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: FadeInImage(
                  placeholder: AssetImage("assets/images/logo2.png"),
                  image: theImage.image,
                ),
              ),
            ),
            SizedBox(width: 10),
            Center(
              child: Text(
                titleChapter,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
