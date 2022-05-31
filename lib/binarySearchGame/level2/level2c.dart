import '../../openNumber.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../backButton.dart';
import '../../discardNumber.dart';
import '../../foundNumber.dart';
import '../level1.dart';
import '../../searchNumber.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../global.dart';

class Level2cPage extends StatefulWidget {
  Level2cPage();
  @override
  State<Level2cPage> createState() => _Level2cPageState();
}

class _Level2cPageState extends State<Level2cPage> {
  int swap1 = 0;
  int swap2 = 0;
  int swap3 = 0;
  int swap4 = 0;
  int swap5 = 0;
  bool isVisibleGood = false;
  bool isVisible = false;
  bool isVisibleBad = false;

  @override
  Widget build(BuildContext context) {
    Widget swapWidget1;
    if (swap1 == 0) {
      swapWidget1 = openNumber(number: '1');
    } else if (swap1 == 1) {
      swapWidget1 = searchNumber(number: '1');
    } else if (swap1 == 2) {
      swapWidget1 = discardNumber(number: '1');
    } else {
      swapWidget1 = foundNumber(number: '1');
    }

    Widget swapWidget2;
    if (swap2 == 0) {
      swapWidget2 = openNumber(number: '2');
    } else if (swap2 == 1) {
      swapWidget2 = searchNumber(number: '2');
    } else if (swap2 == 2) {
      swapWidget2 = discardNumber(number: '2');
    } else {
      swapWidget2 = foundNumber(number: '2');
    }

    Widget swapWidget3;
    if (swap3 == 0) {
      swapWidget3 = openNumber(number: '3');
    } else if (swap3 == 1) {
      swapWidget3 = searchNumber(number: '3');
    } else if (swap3 == 2) {
      swapWidget3 = discardNumber(number: '3');
    } else {
      swapWidget3 = foundNumber(number: '3');
    }

    Widget swapWidget4;
    if (swap4 == 0) {
      swapWidget4 = openNumber(number: '4');
    } else if (swap4 == 1) {
      swapWidget4 = searchNumber(number: '4');
    } else if (swap4 == 2) {
      swapWidget4 = discardNumber(number: '4');
    } else {
      swapWidget4 = foundNumber(number: '4');
    }

    Widget swapWidget5;
    if (swap5 == 0) {
      swapWidget5 = openNumber(number: '5');
    } else if (swap5 == 1) {
      swapWidget5 = searchNumber(number: '5');
    } else if (swap5 == 2) {
      swapWidget5 = discardNumber(number: '5');
    } else {
      swapWidget5 = foundNumber(number: '5');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("binary game"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            openNumber(number: '1'),
            openNumber(number: '2'),
            searchNumber(number: '3'),
            discardNumber(number: '4'),
            discardNumber(number: '5'),
          ],
        ),
        Text(
          "you are searching for 2! \n press to fit to the next step",
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  swap1++;
                  swap1 = swap1 % 4;
                });
              },
              child: swapWidget1,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  swap2++;
                  swap2 = swap2 % 4;
                });
              },
              child: swapWidget2,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  swap3++;
                  swap3 = swap3 % 4;
                });
              },
              child: swapWidget3,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  swap4++;
                  swap4 = swap4 % 4;
                });
              },
              child: swapWidget4,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  swap5++;
                  swap5 = swap5 % 4;
                });
              },
              child: swapWidget5,
            ),
          ],
        ),
        Visibility(
            visible: isVisibleGood,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_oaw8d1yt.json',
                height: 200,
                repeat: false)),
        Visibility(
            visible: isVisibleBad,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_jq4i7W.json',
                height: 200,
                repeat: false)),
        ElevatedButton(
            onPressed: () {
              if (swap1 == 0 &&
                  swap2 == 3 &&
                  swap3 == 1 &&
                  swap4 == 2 &&
                  swap5 == 2) {
                setState(() {
                  isVisibleGood = !isVisibleGood;
                  isVisible = !isVisible;
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final User user = auth.currentUser!;
                  final uid = user.uid;
                  FirebaseDatabase database = FirebaseDatabase.instance;
                  DatabaseReference myRef =
                      FirebaseDatabase.instance.ref("progress/user");
                  var ref = myRef.child(uid);
                  ref.update({
                    "levelsBinary": 7,
                  });
                  levelBinary = 7;
                });
              } else {
                setState(() {
                  isVisibleBad = !isVisibleBad;
                });
              }
            },
            child: Text('Submit')),
        Visibility(
            visible: isVisible,
            child: ElevatedButton(
              child: Text("continue"),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Level2cPage(),
                    ));
              },
            )),
        AllBackButton(),
      ]),
    );
  }
}
