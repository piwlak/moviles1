import 'package:flutter/material.dart';
import 'package:moviles1/screen/LoginPageDesktop.dart';
import 'package:moviles1/screen/LoginPageMobile.dart';
import '../widgets/responsive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive_layout(
        mobileBody: LoginPageMobile(),
        destopbody: LoginPageDestop(),
      ),
    );
  }
}
