import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'singleItemSearched.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  List listTitle = [], listGenre = [], listURL = [], listLike = [], listAuthor = [], listDescr = [];
  var listImage = <Widget>[], _listImage = <Widget>[];
  var loadStatus;

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadStatus = getListImage();
    _onSearchChanged();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() async {
    listImage = <Widget>[];

    if (_searchController.text != "") {
      for (var i = 0; i < listTitle.length; i++)
        if (listTitle[i]
            .toString()
            .toLowerCase()
            .contains(_searchController.text.toLowerCase())) {
          listImage.add(_listImage[i]);
        }

      if (listImage.length == 0)
        listImage.add(Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "No result found :(",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ));
    } else
      listImage = List.from(_listImage);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: kToolbarHeight * 0.5,
          child: TextField(
            style: TextStyle(
              fontSize: 11,
            ),
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search Title...",
              hintStyle: TextStyle(
                fontSize: 11,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(right: 10),
              child: Ink(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: listImage,
        ),
      ),
    );
  }

  getListImage() async {
    firebase_firestore.CollectionReference _collectionRef =
        firebase_firestore.FirebaseFirestore.instance.collection("Manga");

    await _collectionRef
        .get()
        .then((firebase_firestore.QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listTitle.add(doc["title"]);
        listGenre.add(doc["genre"]);
        listLike.add(doc["like"]);
        listAuthor.add(doc["author"]);
        listDescr.add(doc["description"]);
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

        _listImage.add(new singleRecommend(
          ref: listURL[i],
          title: listTitle[i],
          genre: listGenre[i],
          like: listLike[i].toString(),
          author: listAuthor[i],
          descr: listDescr[i],
        ));
      });

      if (i == listTitle.length - 1) setState(() {
        listImage = List.from(_listImage);
      });
    }
    return "complete";
  }
}
