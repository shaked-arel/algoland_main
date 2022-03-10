import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String qeustionText;

  Question(this.qeustionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        qeustionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}