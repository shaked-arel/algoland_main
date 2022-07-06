import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../backButton.dart';
import '../level2/main.dart';
import '../../normalNumber.dart';
import '../../sortNumber.dart';
import '../../sortedNumber.dart';
import 'dart:math';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'level1c.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/palette.dart';

class Level1dPage extends StatefulWidget {
  @override
  State<Level1dPage> createState() => _Level1dState();
}

class _Level1dState extends State<Level1dPage> with TickerProviderStateMixin {
  bool swap = false;
  Color col = Palette.yellow;
  @override
  Widget build(BuildContext context) {
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
          title: Text("Level 4",
              style: GoogleFonts.robotoFlex(fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white, // appbar color.
          foregroundColor: Palette.darkBlue2, // appbar text color.
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/game-backg.png'), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                'press if the algorithm \n should swap',
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 415,
                height: 90,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          swapWidgetReverse,
                          swapWidget,
                          SortedNumber(number: "14"),
                          SortedNumber(number: "27"),
                          SortedNumber(number: "39")
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 250,
                height: 50,
                child: RaisedButton(
                  color: col,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    'Swap',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      swap = !swap;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 250,
                height: 50,
                child: RaisedButton(
                  color: Palette.lightBlue2,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    'Check',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (!swap) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: Color(0xfbfbfbfb),
                                title: Text("Good job"),
                                content: Image.asset(
                                  'assets/good.gif',
                                  width: 200,
                                  height: 200,
                                ),
                                actions: [
                                  Column(
                                    children: <Widget>[
                                      Center(
                                        child: RaisedButton(
                                          color: col,
                                          textColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Text(
                                            'Continue',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Level2Page()));
                                            // Navigator.push(
                                            //     context,
                                            //     new MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           Level2Page(),
                                            //     ));
                                          },
                                        ),
                                      ),
                                      AllBackButton(),
                                    ],
                                  )
                                ],
                              ));

                      setState(() {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final User user = auth.currentUser!;
                        final uid = user.uid;
                        FirebaseDatabase database = FirebaseDatabase.instance;
                        DatabaseReference myRef =
                            FirebaseDatabase.instance.ref("progress/user");
                        var ref = myRef.child(uid).child("levelsBubble");
                        ref.update({
                          "3": 1,
                        });
                        levelsBubble[3] = 1;
                      });
                    } else {}
                  },
                ),
              )
            ],
          ),
        ));
  }
}
