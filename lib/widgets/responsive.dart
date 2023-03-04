import 'package:flutter/material.dart';

class Responsive_layout extends StatelessWidget {
  final Widget mobileBody;
  final Widget destopbody;

  Responsive_layout({required this.mobileBody, required this.destopbody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } else {
          return destopbody;
        }
      },
    );
  }
}
