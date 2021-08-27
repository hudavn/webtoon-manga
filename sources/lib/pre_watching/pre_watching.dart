import 'package:flutter/material.dart';
import 'package:manga/pre_watching/animation_sub.dart';
import 'sub_pre/introduce.dart';


class PreWatching extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: (){},
          ),
          actions: [
            TextButton.icon(
              onPressed: (){},
              icon: AnimationSub(),
              label: Text('Subscribe'),
            )
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Introduce(),
            ],
          ),
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}