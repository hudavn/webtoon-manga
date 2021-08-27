import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga/read/watching.dart';


class ListViewChapter extends StatelessWidget{

  final String name;
  final String image;
  final int chapterNum;
  final Function press;
  final String date;
  final int numLike;
  const ListViewChapter({
    Key? key,
    required this.name,
    required this.chapterNum,
    required this.press,
    required this.image,
    required this.date,
    required this.numLike,

}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      width: size.width - 10,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: Colors.black26,
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                  builder: (context) => Watching(
                    num: chapterNum,
                  ),
                )
                );
              },
              child: Row(
                children: <Widget>[
                  Image.asset(image),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Chapter $chapterNum : $name \n",
                          style: TextStyle(fontSize: 15),
                        ),

                        WidgetSpan(
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                              "$numLike",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                              "$date",
                              style: TextStyle(fontSize: 14, color: Colors.white38),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


