import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/SettingPage.dart';
import 'function.dart';

class More extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.black
      ),
      home: MorePage(),
    );
  }
}
class MorePage extends StatefulWidget{
  @override
  _MorePageState createState() => _MorePageState();
}
class _MorePageState extends State<MorePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'More', style: TextStyle(fontSize: 30, color: Colors.white)),
        //),
        backgroundColor: Colors.blueGrey[300],
      ),
      body:Container(
       padding: const EdgeInsets.all(12),
       child: ListView(
         children: <Widget>[
           SizedBox(height: 50,),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Flexible(
                   flex: 1,
                   child: Container(
                     padding: const EdgeInsets.all(28),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         IconButton(
                             onPressed: (){},
                             icon: Icon(Icons.search,size: 40,color: Colors.white,)),
                         Text('Search',style: TextStyle(fontSize: 15,color: Colors.white),),
                       ],
                     ),
                     decoration: BoxDecoration(border: Border.all(color: Colors.white))
                 ),),

                 Flexible(
                   flex: 1,
                   child: Container(
                     padding: const EdgeInsets.all(28),
                     child: Column(
                       children: [
                         IconButton(
                             icon: const Icon(Icons.settings,size: 40,color: Colors.white,),
                           onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
                           }
                         ),
                         Text('Settings',style: TextStyle(fontSize: 15,color: Colors.white),),
                       ],
                     ),
                     decoration: BoxDecoration(border: Border.all(color: Colors.white))
                 ),),

                 Flexible(
                   flex: 1,
                   child: Container(
                     padding: const EdgeInsets.all(28),
                     child: Column(
                       children: [
                         IconButton(
                           icon: const Icon(Icons.doorbell_rounded,size: 40,color: Colors.white,),
                           onPressed: (){},
                         ),
                         Text('Notice',style: TextStyle(fontSize: 15,color: Colors.white),),
                       ],
                     ),
                     decoration: BoxDecoration(border: Border.all(color: Colors.white))
                 ),)
               ],
             )
             )
         ],
       ),
      )
    );
  }
}