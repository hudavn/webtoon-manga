import 'package:flutter/material.dart';
import 'package:manga/pre_watching/sub_pre/chapter.dart';
import 'package:manga/read/watching.dart';

class Introduce extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: size.height * .12, left: size.width * .1, right: size.width * .02),
                height: size.height * .35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/3.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0, top: 0, right: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        "Romantic",
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "YOUR NAME",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Time travel and soul swap ...\n",
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                width: 90.0,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => Watching(num: 1,),
                                    )
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            "Go to 1st Ep. >",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),

                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListViewChapter(
                      name: "Your name",
                      chapterNum: 1,
                      image: "assets/1.png",
                      date: "Aug 21, 2021",
                      numLike: 0,
                      press: (){},
                      ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}