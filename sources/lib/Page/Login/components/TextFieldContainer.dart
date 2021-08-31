import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  const TextFieldContainer({
    Key ?key,
    required this.child,
    required this.color,
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.fromLTRB(size.width*0.025, 0, 0, 0),
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }
}
