import 'package:flutter/material.dart';


class HomeBottomRead extends StatefulWidget{
  const HomeBottomRead({Key? key}) : super(key: key);
  @override
  State<HomeBottomRead> createState() => HomeBottom();
}

class HomeBottom extends State<HomeBottomRead>{

  @override
  Widget build(BuildContext context) {


    return BottomNavigationBar(
      //backgroundColor: Colors.white,
      iconSize: 30,
      unselectedFontSize: 20,
      selectedFontSize: 15,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, color: Colors.white,),
          label: "Like",
          backgroundColor: Colors.black,


        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment, color: Colors.white),
          label: "Comment",
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          label: "Back",
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
          label: "Next",
          backgroundColor: Colors.black,
        )
      ],

    );
  }
}