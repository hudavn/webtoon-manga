import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import 'applicationState.dart';

class Account {
  String? Email;
  String? Password;
}

class LoginPage extends StatefulWidget {
  const LoginPage({required this.loginSuccess});

  final void Function() loginSuccess;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var data = Account();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.bottomCenter,
        child: ListView(
          children: <Widget>[
            Card(
              color: const Color(0xFF212121),
              child: Container(
                height: 200,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Text(
                        'Join us to enjoy free comics',
                        style: TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      child: Image.asset(
                        'assets/images/GirlLogin.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => ApplicationState(),
              builder: (context, _) => Consumer<ApplicationState>(
                builder: (context, appState, _) => Authentication(
                  email: appState.email,
                  loginState: appState.loginState,
                  startForgetFlow: appState.startForgetFlow,
                  verifyEmail: appState.verifyEmail,
                  signInWithEmailAndPassword:
                      appState.signInWithEmailAndPassword,
                  cancelRegistration: appState.cancelRegistration,
                  cancelLogin: appState.cancelSignin,
                  cancelRecoveryPassword: appState.cancelForgetPassword,
                  registerAccount: appState.registerAccount,
                  recoveryPassword: appState.recoveryPassword,
                  signOut: appState.signOut,
                  loginSuccess: widget.loginSuccess,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
