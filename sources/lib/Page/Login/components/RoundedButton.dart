import 'dart:io';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key?key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.45,
      margin: EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor,fontSize: 18),
          ),
        )
      )
    );
  }
}