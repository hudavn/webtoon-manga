//chua_lien_ket_de_dieu_huong

import 'package:flutter/material.dart';

class AnimationLike extends StatefulWidget{
  AnimationLike({Key? key}) : super(key: key);
  @override
  AnimationLikeState createState() => AnimationLikeState();
}

class AnimationLikeState extends State<AnimationLike>{
  bool active = false;
  void handleTap(){
    setState(() {
      active = !active;
    });
  }
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Icon(
            active ? Icons.favorite_border : Icons.favorite,
          ),
        ),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.deepOrange,
        ),
      ),
    );
  }
}