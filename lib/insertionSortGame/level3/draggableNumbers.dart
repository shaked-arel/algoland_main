import 'package:flutter/material.dart';
import 'dragableWidget.dart';

class DraggableNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FruitBox("20"),
          FruitBox("70"),
          FruitBox("79"),
          FruitBox("7"),
          FruitBox("14")
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FruitBox("34"),
          FruitBox("66"),
          FruitBox("51"),
          FruitBox("12"),
          FruitBox("93")
        ],
      )
    ]);
  }
}
