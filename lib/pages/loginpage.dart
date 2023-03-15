import 'package:flutter/material.dart';
import 'package:moviles1/screenDesktop/LoginPageDesktop.dart';
import 'package:moviles1/screen/LoginPageMobile.dart';
import '../widgets/responsive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive_layout(
        mobileBody: const LoginPageMobile(),
        destopbody: const LoginPageDestop(),
      ),
    );
  }
}
