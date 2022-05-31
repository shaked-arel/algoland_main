import 'package:flutter/material.dart';

class openNumber extends StatelessWidget {
  final String number;

  openNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        // decoration: BoxDecoration( ),
        child: Center(
            child: Text(
          number,
          style: TextStyle(fontSize: 42, color: Colors.black54),
        )));
  }
}
