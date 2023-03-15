// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:moviles1/screenDesktop/onBoardDesktop.dart';
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
        mobileBody: const OnboardingPage(),
        destopbody: const OnBoardDesktop(),
      ),
    );
  }
}
