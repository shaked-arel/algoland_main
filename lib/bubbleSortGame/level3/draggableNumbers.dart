import 'package:flutter/material.dart';
import 'dragableWidget.dart';

class DraggableNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FruitBox("15"),
          FruitBox("24"),
          FruitBox("79"),
          FruitBox("7"),
          FruitBox("14")
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FruitBox("35"),
          FruitBox("66"),
          FruitBox("84"),
          FruitBox("12"),
          FruitBox("47")
        ],
      )
    ]);
  }
}
