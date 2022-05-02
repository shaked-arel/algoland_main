import 'package:flutter/material.dart';
import '../normalNumber.dart';
import '../sortNumber.dart';
import '../sortedNumber.dart';
import 'dart:math';

class Level1Page extends StatefulWidget {
  @override
  State<Level1Page> createState() => _Level1State();
}

class _Level1State extends State<Level1Page> {
  Random rnd = new Random();
  bool swap = false;

  @override
  Widget build(BuildContext context) {
    var buttonTile = ListTile(
      title: RaisedButton(
        child: Text("Swap"),
        onPressed: () {
          setState(() {
            swap = !swap;
          });
        },
      ),
    );

    Widget swapWidget;
    if (swap) {
      swapWidget = SortNumber(number: "55");
    } else {
      swapWidget = SortNumber(number: "39");
    }

    Widget swapWidgetReverse;
    if (swap) {
      swapWidgetReverse = SortNumber(number: "39");
    } else {
      swapWidgetReverse = SortNumber(number: "55");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Switch game"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NormalFormNumber(number: "20"),
              swapWidgetReverse,
              swapWidget,
              NormalFormNumber(number: "7"),
              SortedNumber(number: "64")
            ],
          ),
          Text("press if the algorithm should swap"),
          buttonTile,
        ],
      ),
    );
  }
}
