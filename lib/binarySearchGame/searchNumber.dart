import 'package:flutter/material.dart';

class searchNumber extends StatelessWidget {
  final String number;

  searchNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        // decoration: BoxDecoration( ),
        child: Center(
            child: Text(
          number,
          style: TextStyle(fontSize: 42, color: Colors.blue),
        )));
  }
}
