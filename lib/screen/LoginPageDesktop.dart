import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import '../widgets/header_widget.dart';

class LoginPageDestop extends StatefulWidget {
  const LoginPageDestop({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageDestop> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                child: Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight,
                  false,
                  Icons
                      .heart_broken_outlined), //let's create a common header widget
            )),
            Positioned(
                child: SafeArea(
                    child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 600,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          children: [
                            Text(
                              'SocialiTec',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Signin into your account',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.4),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  'User Name',
                                                  'Enter your user name',
                                                  context),
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Please enter your User Name";
                                            }
                                            return null;
                                          }),
                                      decoration: ThemeHelper()
                                          .inputBoxDecorationShaddow(),
                                    ),
                                    SizedBox(height: 10.0),
                                    Container(
                                      child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          obscureText: false,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  'Password',
                                                  'Enter your password',
                                                  context),
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Please enter your Password";
                                            }
                                            return null;
                                          }),
                                      decoration: ThemeHelper()
                                          .inputBoxDecorationShaddow(),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 0, 10, 20),
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPasswordPage()),
                                          );
                                        },
                                        child: Text(
                                          "Forgot your password?",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: ThemeHelper()
                                          .buttonBoxDecoration(context),
                                      child: ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              70, 10, 70, 10),
                                          child: Text(
                                            'Sign In'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProfilePage()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      //child: Text('Don\'t have an account? Create'),
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: "Don\'t have an account? ",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground)),
                                        TextSpan(
                                          text: 'Create',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegistrationPage()));
                                            },
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer),
                                        ),
                                      ])),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ),
                ],
              ),
            )))
          ],
        ),
      ),
    );
  }
}
/**/