import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

GestureDetector buildOptionsWithoutActions(BuildContext context,String title)
{
  return GestureDetector(
      child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(
                  fontSize: 20,
                  fontWeight:  FontWeight.w500,
                  color: Colors.white
              ))
            ],
          )
      )
  );
}
GestureDetector buildOptionsWithActionExtend(BuildContext context,String title)
{
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("test")
            ],
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Close"))
          ],
        );
      });
    },
      child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(
                  fontSize: 20,
                  fontWeight:  FontWeight.w500,
                  color: Colors.white
              )),
              Icon(Icons.arrow_forward,color: Colors.white)
            ],
          )
      )
  );
}
Padding buildOptionsWithActionTurnOnOff(String title,bool value,Function onChangeMethod)
{
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
              fontSize: 20,
              fontWeight:  FontWeight.w500,
              color: Colors.white
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
  );
}