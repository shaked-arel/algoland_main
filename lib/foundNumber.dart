import 'package:flutter/material.dart';

class foundNumber extends StatelessWidget {
  final String number;

  foundNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Center(
            child: Text(
          number,
          style: TextStyle(fontSize: 42, color: Colors.green),
        )));
  }
}
