
import 'package:flutter/material.dart';
import 'package:sources/Page/Signup/components/SignupNowbutton.dart';
import 'package:sources/Page/Signup/components/TextContainer.dart';
import 'package:sources/Page/Signup/components/TermsAndPolicy.dart';

class dataSignup extends StrutStyle {
  String? emailAdd;
  String? Pw;
  String? rePw;
  String? nickname;
  String? answer1;
  String? answer2;
  String? answer3;
}

class SignupPage extends StatelessWidget {
  var data = dataSignup();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
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
                  'PASSWORD *',
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
                      hintText: 'Enter Password (6-16 characters)',
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                ),
              ),
              TextContainer(
                color: Colors.white10,
                child: Text(
                  'RE-TYPE PASSWORD *',
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
                      hintText: 'Enter Password (6-16 characters)',
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                ),
              ),
              TextContainer(
                color: Colors.white10,
                child: Text(
                  'NICKNAME *',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              TextContainer(
                color: Colors.black12,
                child: TextField(
                  onChanged: (value) {
                    data.nickname = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Nickname (max 20 characters)',
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
              TermsPolicy(
                pressTerms: (){},
                pressPolicy: (){},
              ),
              SignupNowButton(
                press: (){
                  print(data.emailAdd);
                  print(data.Pw);
                  print(data.rePw);
                  print(data.nickname);
                  print(data.answer1);

                },
              ),
            ],
          ),
        );
  }
}
