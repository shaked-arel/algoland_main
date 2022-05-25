import 'package:flutter/material.dart';

class NormalFormNumber extends StatelessWidget {
  final String number;

  NormalFormNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                  child: Text(
                number,
                style: TextStyle(fontSize: 40),
              )))),
    );
  }
}
