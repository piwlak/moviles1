import 'package:flutter/material.dart';

class Loading_modal_w extends StatelessWidget {
  const Loading_modal_w({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 151, 255, 255),
      child: Center(child: Image.asset('assets/loading.gif')),
    );
  }
}
