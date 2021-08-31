import 'package:flutter/material.dart';
import 'package:sources/Page/Login/components/TextFieldContainer.dart';

class RoundedInputField extends StatelessWidget{
  final bool obscure;
  final String hintText;
  final IconData icon;
  final Color color, iconColor;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key ?key,
    required this.obscure,
    required this.hintText,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      color: color,
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: iconColor,
          ),
          hintText: hintText,
          border: InputBorder.none
        ),
      ),
    );
  }
}