import 'package:flutter/material.dart';

class discardNumber extends StatelessWidget {
  final String number;

  discardNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        // decoration: BoxDecoration( ),
        child: Center(
            child: Text(
          number,
          style: TextStyle(
              fontSize: 42,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
              decorationThickness: 1.7,
              color: Colors.red),
        )));
  }
}
