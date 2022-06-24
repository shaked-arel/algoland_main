import 'package:binarysearch/config/palette.dart';
import 'package:flutter/material.dart';

class FruitBox extends StatelessWidget {
  final String boxValue;

  FruitBox(this.boxValue);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: boxValue,
      child: SizedBox(
        width: 75,
        height: 75,
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
                  boxValue,
                  style: TextStyle(fontSize: 40),
                )))),
      ),
      feedback: Material(
        child: Container(
          color: Palette.orange,
          height: 75,
          width: 75,
          child: Center(
            child: Text(
              boxValue,
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        height: 75,
        width: 75,
        // color: Palette.lightBlue,
      ),
    );
  }
}
