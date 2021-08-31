import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  const TextContainer({
    Key ?key,
    required this.child,
    required this.color,
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
      width: size.width,
      height: size.height*0.065,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: color,
        shape: BoxShape.rectangle
      ),
      child: child,
    );
  }
}
