import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sources/pre_watching/sub_pre/chapter.dart';
import 'package:sources/read/watching.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'chapter.dart';

class Introduce extends StatefulWidget {
  Introduce({
    required this.ref,
    required this.title,
    required this.genre,
    required this.descr,
    required this.author,
  });

  final String ref, title, genre, descr, author;

  @override
  _IntroduceState createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  List ListTitleChapter = [];
  var size, theImage;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    theImage = Image.network(
      widget.ref,
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.darken,
    );
    precacheImage(theImage.image, context);
    getListChapter();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 300,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: theImage.image,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.2), BlendMode.dstATop)),
          ),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topRight,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.genre,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      widget.descr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 20, right: 20),
              //   width: 120,
              //   height: 50,
              //   child: GestureDetector(
              //     onTap: () {
              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //       builder: (context) => Watching(
              //       //         num: 1,
              //       //       ),
              //       //     ));
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.black,
              //           width: 2,
              //         ),
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       child: Center(
              //         child: Text(
              //           "Go to 1st Ep. >",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 8,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        ListViewChapter(
          title: widget.title,
          ref: widget.ref,
          ListTitleChapter: ListTitleChapter,
        ),
      ],
    );
  }

  getListChapter() async {
    firebase_firestore.CollectionReference _collectionRef =
        firebase_firestore.FirebaseFirestore.instance.collection(widget.title);

    await _collectionRef
        .orderBy('id', descending: false)
        .get()
        .then((firebase_firestore.QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ListTitleChapter.add(doc["title"]);
      });
    });

    setState(() {});
  }
}

class ListViewChapter extends StatelessWidget {
  ListViewChapter(
      {required this.title, required this.ref, required this.ListTitleChapter});
  final String title, ref;
  final List ListTitleChapter;
  var ListChapter = <Widget>[];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < ListTitleChapter.length - 1; i++) {
      ListChapter.add(SingleChapter(
          title: title,
          ref: ref,
          titleChapter: ListTitleChapter[i]));
    }

    return Column(
      children: ListChapter,
    );
  }
}
