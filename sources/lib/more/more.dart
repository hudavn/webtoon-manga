import 'package:flutter/material.dart';
import 'package:sources/home/sub/bottom_navigation_bar.dart';
import 'package:sources/loginpage/widgets.dart';
import 'package:sources/search/search.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({required this.currentIndex, required this.onTabTapped, required this.signOut});

  final int currentIndex;
  final void Function(int id) onTabTapped;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x8A000000),
      appBar: AppBar(
        backgroundColor: Color(0x8A000000),
        bottomOpacity: 0,
        elevation: 0,
        title: Text(
          "MORE",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Table(
            border: TableBorder(
              verticalInside: BorderSide(width: 0.8, color: Colors.grey),
              top: BorderSide(width: 0.8, color: Colors.grey),
              bottom: BorderSide(width: 0.8, color: Colors.grey),
            ),
            children: [
              TableRow(
                children: [
                  Container(
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 40),
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                      onPressed: () => _showDialog(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, size: 40),
                          Text(
                            "Settings",
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                      onPressed: () => _showDialog(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.translate,
                            size: 40,
                          ),
                          Text(
                            "Fan translation",
                            style: TextStyle(fontSize: 8),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 100,
                ),
                primary: Colors.white,
                onSurface: Colors.blueAccent,
                backgroundColor: Colors.green[500],
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: signOut,
              child: Text(
                "Log out",
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Notice",
          style: const TextStyle(fontSize: 16),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Hi, we are the development team of Webtoon Manga\n\nThis is currently still in development\n\nSorry for the inconvenience!",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          StyledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      );
    },
  );
}
