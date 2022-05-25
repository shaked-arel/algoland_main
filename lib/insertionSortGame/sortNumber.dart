import 'package:flutter/material.dart';

class SortNumber extends StatelessWidget {
  final String number;

  SortNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Center(
                  child: Text(
                number,
                style: TextStyle(fontSize: 40, color: Colors.blue),
              )))),
    );
  }
}
