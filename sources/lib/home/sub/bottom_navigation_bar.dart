import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar(
      {required this.currentIndex, required this.onTabTapped});

  final int currentIndex;
  final void Function(int index) onTabTapped;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 40,
      child: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        backgroundColor: Colors.black45,
        iconSize: 20,
        unselectedFontSize: 7,
        selectedFontSize: 7,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
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
      ),
    );
  }
}
