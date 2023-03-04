import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  int current = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Radio(
            value: 1,
            groupValue: current,
            onChanged: (value) {
              setState(() {
                current = value!;
              });
            }),
        Radio(
            value: 2,
            groupValue: current,
            onChanged: (value) {
              setState(() {
                current = value!;
              });
            }),
        Radio(
            value: 3,
            groupValue: current,
            onChanged: (value) {
              setState(() {
                current = value!;
              });
            }),
      ],
    );
  }
}
