import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      backgroundColor: Colors.black45,
      iconSize: 30,
      unselectedFontSize: 7,
      selectedFontSize: 7,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.local_library_outlined),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: "MY",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_outlined),
          label: "MORE",
        )
      ],
    );
  }
}
