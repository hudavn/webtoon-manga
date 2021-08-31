import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sources/Page/Login/components/RoundedButton.dart';
import 'package:sources/Page/Login/components/Rounded_InputField.dart';
import 'package:sources/Page/Signup/SignupPage.dart';
import 'package:sources/Page/Forgot/ForgetPage.dart';

class Account{
  String? Email;
  String? Password;
}

class LoginPage extends StatelessWidget {
  var data = Account();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.025, size.height * 0.2, size.width * 0.025, 0),
            constraints: BoxConstraints.expand(),
            child: ListView(
              children: <Widget>[
                Card(
                  color: const Color(0xFF212121),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.5,
                        padding:
                            EdgeInsets.fromLTRB(size.width * 0.02, 0, 0, 0),
                        height: size.height * 0.225,
                        alignment: Alignment.center,
                        child: Text(
                          'Sign up or log in to enjoy free comics',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Image.asset(
                        'asset/images/GirlLogin.png',
                        width: size.width * 0.425,
                        height: size.height * 0.225,
                      )
                    ],
                  ),
                ),
                RoundedInputField(
                  obscure: false,
                  hintText: 'Enter Email Address',
                  icon: Icons.mail,
                  iconColor: Colors.black26,
                  color: Colors.black12,
                  onChanged: (value) {
                    data.Email = value;
                  },
                ),
                RoundedInputField(
                  obscure: true,
                  hintText: 'Enter Password',
                  icon: Icons.lock,
                  iconColor: Colors.black26,
                  color: Colors.black12,
                  onChanged: (value) {
                    data.Password = value;
                  },
                ),
                Row(
                  children: <Widget>[
                    RoundedButton(
                      color: Colors.grey,
                      textColor: Colors.white,
                      text: 'Sign up',
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      },
                    ),
                    RoundedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      text: 'Log in',
                      press: () {
                        print(data.Email);
                        print(data.Password);
                      },
                    )
                  ],
                ),
                TextButton(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgetPage();
                    }));
                  },
                )
              ],
            )));
  }
}
