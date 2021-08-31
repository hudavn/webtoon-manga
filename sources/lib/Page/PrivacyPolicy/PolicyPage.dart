import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
    );
  }
}
