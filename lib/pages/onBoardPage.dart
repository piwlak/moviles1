import 'package:flutter/material.dart';
import 'package:moviles1/screen/LoginPageDesktop.dart';
import 'package:moviles1/screen/LoginPageMobile.dart';
import 'package:moviles1/screen/onBoardDesktop.dart';
import 'package:moviles1/screen/onBoardMobile.dart';
import '../widgets/responsive.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive_layout(
        mobileBody: OnboardingPage(),
        destopbody: OnBoardDesktop(),
      ),
    );
  }
}
