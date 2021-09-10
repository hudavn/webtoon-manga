import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Watching extends StatelessWidget {
  Watching({
    required this.title,
    required this.titleChapter,
  });

  final String title, titleChapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              titleChapter + " - " + title,
              style: TextStyle(fontSize: 12),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hi, we are the development team of Webtoon Manga\n\nThis is currently still in development\n\nSorry for the inconvenience!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Use your device's navigation bar to go back and continue enjoying other chapters!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.green),
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            iconSize: 40,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios_sharp),
                label: "Previous chapter",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward_ios_sharp),
                label: "Next chapter",
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListPageChapter(title: title, titleChapter: titleChapter),
      ),
    );
  }
}

class ListPageChapter extends StatefulWidget {
  ListPageChapter({
    required this.title,
    required this.titleChapter,
  });

  final String title, titleChapter;

  @override
  _ListPageChapterState createState() => _ListPageChapterState();
}

class _ListPageChapterState extends State<ListPageChapter> {
  var listPage = <Widget>[], result, init = 1;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) getMoreData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, i) {
        if (i == listPage.length) return LinearProgressIndicator();
        return listPage[i];
      },
      itemCount: listPage.length + 1,
    );
  }

  getMoreData() async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    var _title = widget.title, _titleChapter = widget.titleChapter;
    bool stop = false;

    if (init == 1) {
      result = await storage
          .ref()
          .child("manga")
          .child(_title)
          .child(_titleChapter)
          .list(firebase_storage.ListOptions(maxResults: 5));
      init = 0;
    } else if (result.nextPageToken != Null)
      result = await storage
          .ref()
          .child("manga")
          .child(_title)
          .child(_titleChapter)
          .list(firebase_storage.ListOptions(
              maxResults: 5, pageToken: result.nextPageToken));
    else stop = true;

    if (!stop)
      for (firebase_storage.Reference ref in result.items) {
        String downloadURL = await storage.ref(ref.fullPath).getDownloadURL();
        listPage.add(
          FadeInImage(
            placeholder: AssetImage("assets/images/logo2.png"),
            image: Image.network(
              downloadURL,
              fit: BoxFit.fitWidth,
            ).image,
            fit: BoxFit.fitWidth,
          ),
        );
        setState(() {});
      }
  }
}
