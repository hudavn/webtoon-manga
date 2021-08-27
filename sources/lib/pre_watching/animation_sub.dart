import 'package:flutter/material.dart';

class AnimationSub extends StatefulWidget{
  AnimationSub({Key? key}) : super(key: key);
  @override
  AnimationSubState createState() => AnimationSubState();
}

class AnimationSubState extends State<AnimationSub>{
  bool active = true;
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
            active ? Icons.add_circle_outline : Icons.check,
          ),
        ),
      ),
    );
  }
}