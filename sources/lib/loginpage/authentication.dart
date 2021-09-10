import 'package:flutter/material.dart';
import 'widgets.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
  forgetPassword,
}

class Authentication extends StatelessWidget {
  const Authentication({
    required this.loginState,
    required this.email,
    required this.startForgetFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.cancelLogin,
    required this.cancelRecoveryPassword,
    required this.recoveryPassword,
    required this.registerAccount,
    required this.signOut,
    required this.loginSuccess,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startForgetFlow;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function() cancelLogin;
  final void Function() cancelRecoveryPassword;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) recoveryPassword;
  final void Function() signOut;
  final void Function() loginSuccess;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.emailAddress:
        return EmailForm(
            callback: (email) => verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));
      case ApplicationLoginState.password:
        return PasswordForm(
          forget: startForgetFlow,
          cancel: cancelLogin,
          email: email!,
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
          ) {
            registerAccount(
                email,
                displayName,
                password,
                (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
      case ApplicationLoginState.forgetPassword:
        return ForgetPasswordForm(
          cancel: () {
            cancelRecoveryPassword();
          },
          recoveryPassword: (email) {
            recoveryPassword(email,
                (e) => _showErrorDialog(context, 'Recovery password', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        {
          () async {
            await Future.delayed(Duration(milliseconds: 3000));
            loginSuccess();
          }();
          return LinearProgressIndicator();
        }
      default:
        () async {
          await Future.delayed(Duration(milliseconds: 1));
          return Row(
            children: const [
              Text("Internal error, this shouldn't happen..."),
            ],
          );
        }();
        return LinearProgressIndicator();
    }
  }
}

void _showErrorDialog(BuildContext context, String title, Exception e) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                '${(e as dynamic).message}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          StyledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      );
    },
  );
}

class EmailForm extends StatefulWidget {
  const EmailForm({required this.callback});
  final void Function(String email) callback;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('Sign in with email'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      child: StyledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.callback(_controller.text);
                          }
                        },
                        child: const Text('NEXT'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.registerAccount,
    required this.cancel,
    required this.email,
  });
  final String email;
  final void Function(String email, String displayName, String password)
      registerAccount;
  final void Function() cancel;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('Create account'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      hintText: 'First & last name',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your account name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: widget.cancel,
                        child: const Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                      StyledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.registerAccount(
                              _emailController.text,
                              _displayNameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    required this.login,
    required this.email,
    required this.cancel,
    required this.forget,
  });
  final String email;
  final void Function(String email, String password) login;
  final void Function() cancel;
  final void Function() forget;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('Sign in'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StyledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: widget.forget,
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                            TextButton(
                              onPressed: widget.cancel,
                              child: const Text(
                                'Create a new account?',
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    required this.recoveryPassword,
    required this.cancel,
  });

  final void Function(String email) recoveryPassword;
  final void Function() cancel;

  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_ForgetPasswordFormState');
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('Forget password'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12),
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: widget.cancel,
                        child: const Text(
                          'Back to sign in',
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                      StyledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.recoveryPassword(
                              _emailController.text,
                            );
                          }
                        },
                        child: const Text(
                          'Get link recovery',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
