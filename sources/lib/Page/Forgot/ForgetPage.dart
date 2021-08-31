import 'package:flutter/material.dart';
import 'package:sources/Page/Signup/components/SignupNowbutton.dart';
import 'package:sources/Page/Signup/components/TextContainer.dart';
import 'package:sources/Page/Signup/components/TermsAndPolicy.dart';

class dataFoget extends StrutStyle {
  String? emailAdd;
  String? Pw;
  String? rePw;
  String? answer1;
  String? answer2;
  String? answer3;
}

class ForgetPage extends StatelessWidget {
  var  data = dataFoget();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Passowrd'),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          TextContainer(
            color: Colors.white10,
            child: Text(
              'EMAIL ADDRESS *',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          TextContainer(
            color: Colors.black12,
            child: TextField(
              onChanged: (value) {
                data.emailAdd = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter Email Address',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
          ),
          TextContainer(
            color: Colors.white10,
            child: Text(
              'NEW PASSWORD *',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          TextContainer(
            color: Colors.black12,
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                data.Pw = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter New Password (6-16 characters)',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
          ),
          TextContainer(
            color: Colors.white10,
            child: Text(
              'RE-TYPE NEW PASSWORD *',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          TextContainer(
            color: Colors.black12,
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                data.rePw = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter new Password (6-16 characters)',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
          ),
          TextContainer(
            color: Colors.white10,
            child: Text(
              'WHAT IS A THE NAME OF YOUR FIRST PET? *',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          TextContainer(
            color: Colors.black12,
            child: TextField(
              onChanged: (value) {
                data.answer1 = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter Answer (6-16 characters)',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
          ),
          TextContainer(
            color: Colors.white10,
            child: Text(
              'WHAT IS ELEMENTARY SCHOOL DID YOU ATTEND? *',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          TextContainer(
            color: Colors.black12,
            child: TextField(
              onChanged: (value) {
                data.answer2 = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter Answer (6-16 characters)',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
          ),
          TextContainer(
            color: Colors.white10,
            child: Text(
              'WHAT YOUR FAVORITE COLOR? *',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          TextContainer(
            color: Colors.black12,
            child: TextField(
              onChanged: (value) {
                data.answer3 = value;
              },
              decoration: InputDecoration(
                  hintText: 'Enter Answer (6-16 characters)',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
          ),
          SignupNowButton(
            text: 'Save New Password',
            press: () {
              print(data.emailAdd);
              print(data.Pw);
              print(data.rePw);
              print(data.answer1);
              print(data.answer2);
            },
          )
        ],
      ),
    );
  }
}
