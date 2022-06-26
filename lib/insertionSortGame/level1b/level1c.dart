import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../backButton.dart';
import '../../config/palette.dart';
import '../level1b/level1d.dart';
import '../level2/main.dart';
import '../../main.dart';
import '../../normalNumber.dart';
import '../../sortNumber.dart';
import '../../sortedNumber.dart';
import 'dart:math';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Level1cPage extends StatefulWidget {
  @override
  State<Level1cPage> createState() => _Level1cState();
}

class _Level1cState extends State<Level1cPage> with TickerProviderStateMixin {
  bool swap = false;
  Color col = Palette.yellow;
  @override
  Widget build(BuildContext context) {
    var buttonTile = ListTile(
      title: RaisedButton(
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
    );

    Widget swapWidget;
    if (swap) {
      swapWidget = SortNumber(number: "23");
    } else {
      swapWidget = SortNumber(number: "8");
    }

    Widget swapWidgetReverse;
    if (swap) {
      swapWidgetReverse = SortNumber(number: "8");
    } else {
      swapWidgetReverse = SortNumber(number: "23");
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Level 3",
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
                width: 390,
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
                          NormalFormNumber(number: "48"),
                          NormalFormNumber(number: "95"),
                          NormalFormNumber(number: "66")
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
                    if (swap) {
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
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Level1dPage(),
                                                ));
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
                        var ref = myRef.child(uid).child("levelsInsertion");
                        ref.update({
                          "2": 1,
                        });
                        levelsInsertion[2] = 1;
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: Color(0xfbfbfbfb),
                                title: Text("Try Again"),
                                content: Image.asset(
                                  'assets/tryAgain.gif',
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
                                            'Try again',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Level1cPage(),
                                                ));
                                          },
                                        ),
                                      ),
                                      AllBackButton(),
                                    ],
                                  )
                                ],
                              ));
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
