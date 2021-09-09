import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/MorePage.dart';
import 'function.dart';

class Setting extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: SettingPage(),
    );
  }
}
class SettingPage extends StatefulWidget{
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{
  @override
  bool valop = true; //value options cho widget
  _ChangeVal(bool newVal){//ham change value
    setState(() {
      valop = newVal;
    });
  }
  _addTitle(String title){//ham tao tieu de
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          Text(title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black26,
          border: Border.all(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(11))
      ),
      height: 40,
      width: 100,
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings',style: TextStyle(fontSize: 22,color: Colors.white)),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context,true);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black12,
        ),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(height: 20 ),
              _addTitle("Account"),
              Divider(height: 12,thickness: 1,endIndent: 30,indent: 30,color: Colors.white54,),
              buildOptionsWithoutActions(context, "example@gmail.com"),
              SizedBox(height: 15),
              _addTitle("Nick name"),
              Divider(height: 12,thickness: 1,endIndent: 30,indent: 30,color: Colors.white54,),
              buildOptionsWithoutActions(context, "Group1"),
              SizedBox(height: 15),
              _addTitle("Options"),
              Divider(height: 12,thickness: 1,endIndent: 30,indent: 30,color: Colors.white54,),
              buildOptionsWithActionExtend(context,"Change Image Resolution"),
              buildOptionsWithActionExtend(context,"Change Background"),
              buildOptionsWithActionTurnOnOff("Sleep mode",valop,_ChangeVal),
              SizedBox(height: 15),
              _addTitle("About"),
              Divider(height: 12,thickness: 1,endIndent: 30,indent: 30,color: Colors.white54,),
              buildOptionsWithActionExtend(context,"Term of Services"),
              buildOptionsWithActionExtend(context,"Privacy Policy"),
              buildOptionsWithActionExtend(context,"Contact Us"),
            ],
          ),
        )
    );
  }
}