import 'package:flutter/material.dart';

class searchedNumber extends StatelessWidget {
  final String number;

  searchedNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        // decoration: BoxDecoration( ),
        child: Center(
            child: Text(
          number,
          style: TextStyle(fontSize: 20, color: Colors.blue),
        )));
  }
}
