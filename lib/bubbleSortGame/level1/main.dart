import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../backButton.dart';
import '../level1b/level1b.dart';
import '../level2/main.dart';
import '../../main.dart';
import '../../normalNumber.dart';
import '../../sortNumber.dart';
import '../../sortedNumber.dart';
import 'dart:math';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Level1Page extends StatefulWidget {
  @override
  State<Level1Page> createState() => _Level1State();
}

class _Level1State extends State<Level1Page> with TickerProviderStateMixin {
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
              NormalFormNumber(number: "20"),
              swapWidgetReverse,
              swapWidget,
              NormalFormNumber(number: "7"),
              SortedNumber(number: "64")
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
                repeat: true),
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
                if (swap) {
                  setState(() {
                    isVisibleGood = !isVisibleGood;
                    isVisible = !isVisible;
                  });
                  setState(() {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User user = auth.currentUser!;
                    final uid = user.uid;
                    FirebaseDatabase database = FirebaseDatabase.instance;
                    DatabaseReference myRef =
                        FirebaseDatabase.instance.ref("progress/user");
                    var ref = myRef.child(uid);
                    ref.update({
                      "levelsBubble": 1,
                    });
                    levelBubble = 1;
                  });
                } else {
                  setState(() {
                    isVisibleBad = !isVisibleBad;
                    Future.delayed(const Duration(milliseconds: 250), () {
                      isVisibleBad = !isVisibleBad;
                    });
                  });
                }
              },
              child: Text('Check')),
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
                          builder: (context) => Level1bPage()));
                },
                child: Text('continue')),
          ),
          AllBackButton()
        ],
      ),
    );
  }
}
