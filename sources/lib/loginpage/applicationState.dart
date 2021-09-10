import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.emailAddress;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

  ApplicationLoginState get loginState => _loginState;

  String? _email;

  String? get email => _email;

  void startForgetFlow() {
    _loginState = ApplicationLoginState.forgetPassword;
    notifyListeners();
  }

  void verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.password;
    notifyListeners();
  }

  void cancelSignin() {
    _loginState = ApplicationLoginState.register;
    notifyListeners();
  }

  void cancelForgetPassword() {
    _loginState = ApplicationLoginState.password;
    notifyListeners();
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      cancelForgetPassword();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void recoveryPassword(String email,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      errorCallback(FirebaseAuthException(message:
          "A link has been sent to your email address, please check and follow the instructions to recover your password!", code: "0"));
      cancelForgetPassword();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
