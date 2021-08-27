import 'package:flutter/material.dart';
import 'package:manga/pre_watching/sub_pre/introduce.dart';
import 'package:manga/read/home_bottom.dart';


class Watching extends StatelessWidget {
  final int num;
  const Watching({
    Key? key,
    required this.num,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              Navigator.pop(
                  context, MaterialPageRoute(
                builder: (context) => Introduce(),
              )
              );
            },
          ),
          title: Text(
            "Chapter $num",
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              ClipRect(
                child: Image.asset("assets/3.png", fit: BoxFit.fitWidth,),
              ),
              ClipRect(
                child: Image.asset("assets/5.png", fit: BoxFit.fitWidth,),
              ),
              ClipRect(
                child: Image.asset("assets/4.jpg", fit: BoxFit.fitWidth,),
              )
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomRead(),
      ),
      theme: ThemeData.dark(),
    );
  }
}