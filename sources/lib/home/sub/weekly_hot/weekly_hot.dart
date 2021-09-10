import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'list_image_weekly_hot.dart';

class WeeklyHot extends StatefulWidget {
  @override
  _WeeklyHotState createState() => _WeeklyHotState();
}

class _WeeklyHotState extends State<WeeklyHot> {
  Widget _listImage = Container();

  @override
  void initState() {
    getListImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
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
          _listImage,
        ],
      ),
    );
  }

  getListImage() async {
    firebase_firestore.CollectionReference _collectionRef =
        firebase_firestore.FirebaseFirestore.instance.collection("Manga");

    List listTitle = [], listGenre = [], listURL = [], listLike = [], listAuthor = [], listDescr = [];
    await _collectionRef
        .limit(6)
        .orderBy('weeklike', descending: true)
        .get()
        .then((firebase_firestore.QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listTitle.add(doc["title"]);
        listGenre.add(doc["genre"]);
        listLike.add(doc["weeklike"]);
        listAuthor.add(doc["author"]);
        listDescr.add(doc["description"]);
        print(doc["title"]);
      });
    });

    for (var i = 0; i < listTitle.length; i++) {
      firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;

      var title = listTitle[i];
      firebase_storage.ListResult result = await storage
          .ref("cover/$title")
          .list(firebase_storage.ListOptions(maxResults: 1));

      result.items.forEach((firebase_storage.Reference ref) async {
        String downloadURL = await ref.getDownloadURL();
        listURL.add(downloadURL);
      });

      if (i == listTitle.length - 1)
        setState(() {
          _listImage = new ListRecommend(
            listURL: listURL,
            listTitle: listTitle,
            listGenre: listGenre,
            listLike: listLike,
            listAuthor: listAuthor,
            listDescr: listDescr,
          );
        });
    }
  }
}
