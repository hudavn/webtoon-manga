import 'package:flutter/material.dart';

class SignupNowButton extends StatelessWidget {
  final VoidCallback press;
  final text;
  const SignupNowButton({
    Key? key,
    this.text = 'Sign up Now',
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height* 0.08,
        margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: FlatButton(
            color: Colors.grey,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )));
  }
}
