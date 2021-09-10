import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sources/loginpage/LoginPage.dart';
import 'package:sources/more/more.dart';
import 'home/home_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:sources/myseries/myseries.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: currentIndex == -1
          ? LoginPage(loginSuccess: loginSuccess)
          : currentIndex == 0
              ? HomePage(currentIndex: currentIndex, onTabTapped: onTabTapped)
              : currentIndex == 1 ? MySeriesScreen(currentIndex: currentIndex, onTabTapped: onTabTapped) : MoreScreen(
                  currentIndex: currentIndex, onTabTapped: onTabTapped, signOut: signOut),
      theme: ThemeData.dark(),
    );
  }

  loginSuccess() {
    setState(() {
      currentIndex = 0;
    });
  }

  onTabTapped(id) {
    setState(() {
      currentIndex = id;
    });
  }

  signOut() {
    FirebaseAuth.instance.signOut();
    setState(() {
      currentIndex = -1;
    });
  }
}
