import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../backButton.dart';
import '../level2/main.dart';
import '../normalNumber.dart';
import '../sortNumber.dart';
import '../sortedNumber.dart';
import 'dart:math';

import 'level1c.dart';

class Level1dPage extends StatefulWidget {
  @override
  State<Level1dPage> createState() => _Level1dState();
}

class _Level1dState extends State<Level1dPage> with TickerProviderStateMixin {
  Random rnd = new Random();
  bool swap = false;
  bool isVisible = false;
  bool isVisibleGood = false;
  bool isVisibleBad = false;

  //controller
  late final AnimationController _controller;
  late final AnimationController _WrongController;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _WrongController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _WrongController.dispose();
  }

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
      swapWidget = SortNumber(number: "5");
    } else {
      swapWidget = SortNumber(number: "13");
    }

    Widget swapWidgetReverse;
    if (swap) {
      swapWidgetReverse = SortNumber(number: "13");
    } else {
      swapWidgetReverse = SortNumber(number: "5");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Switch game"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              swapWidgetReverse,
              swapWidget,
              SortedNumber(number: "14"),
              SortedNumber(number: "27"),
              SortedNumber(number: "39")
            ],
          ),
          Text("press if the algorithm should swap"),
          buttonTile,
          Visibility(
            visible: isVisibleGood,
            child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_wys2rrr6.json',
                //  controller: _controller,
                height: 200,
                repeat: false),
          ),
          Visibility(
            visible: isVisibleBad,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_2frpohrv.json',
                // controller: _WrongController,
                height: 200,
                repeat: false),
          ),
          ElevatedButton(
              onPressed: () {
                if (!swap) {
                  setState(() {
                    isVisibleGood = !isVisibleGood;
                    isVisible = !isVisible;
                  });
                } else {
                  setState(() {
                    isVisibleBad = !isVisibleBad;
                    //await Future.delayed(Duration(seconds: 2));
                  });
                }
              },
              child: Text('Submit')),
          Visibility(
            visible: isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Level2Page(
                              //    swap: true,
                              )));
                },
                child: Text('continue')),
          ),
          AllBackButton()
        ],
      ),
    );
  }
}
