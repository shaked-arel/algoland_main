import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../backButton.dart';
import '../../config/palette.dart';
import '../level3/main.dart';
import '../../normalNumber.dart';
import '../../sortNumber.dart';
import '../../sortedNumber.dart';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Level2dPage extends StatefulWidget {
  @override
  State<Level2dPage> createState() => _Level2dState();
}

class _Level2dState extends State<Level2dPage> with TickerProviderStateMixin {
  bool swap = false;

  int swap1 = 0;
  int swap2 = 0;
  int swap3 = 0;
  int swap4 = 0;
  int swap5 = 0;
  Color col = Palette.orange;

  @override
  Widget build(BuildContext context) {
    Widget swapWidget2;
    if (swap2 == 0) {
      swapWidget2 = NormalFormNumber(number: "15");
    } else {
      if (swap2 == 1) {
        swapWidget2 = SortNumber(number: "15");
      } else {
        swapWidget2 = SortedNumber(number: "15");
      }
    }

    Widget swapWidget3;
    if (swap3 == 0) {
      swapWidget3 = NormalFormNumber(number: "27");
    } else {
      if (swap3 == 1) {
        swapWidget3 = SortNumber(number: "27");
      } else {
        swapWidget3 = SortedNumber(number: "27");
      }
    }

    Widget swapWidget1;
    if (swap1 == 0) {
      swapWidget1 = NormalFormNumber(number: "4");
    } else {
      if (swap1 == 1) {
        swapWidget1 = SortNumber(number: "4");
      } else {
        swapWidget1 = SortedNumber(number: "4");
      }
    }

    Widget swapWidget4;
    if (swap4 == 0) {
      swapWidget4 = NormalFormNumber(number: "32");
    } else {
      if (swap4 == 1) {
        swapWidget4 = SortNumber(number: "32");
      } else {
        swapWidget4 = SortedNumber(number: "32");
      }
    }

    Widget swapWidget5;
    if (swap5 == 0) {
      swapWidget5 = NormalFormNumber(number: "40");
    } else {
      if (swap5 == 1) {
        swapWidget5 = SortNumber(number: "40");
      } else {
        swapWidget5 = SortedNumber(number: "40");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Level 8",
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
                image: AssetImage('assets/game-back2.png'), fit: BoxFit.cover),
          ),
          child: Column(children: <Widget>[
            SizedBox(
              height: 35,
            ),
            Center(
              child: Text(
                "current",
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
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
                        NormalFormNumber(number: "4"),
                        NormalFormNumber(number: "15"),
                        SortedNumber(number: "27"),
                        SortedNumber(number: "32"),
                        SortedNumber(number: "40"),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              'Click to change the array to fit the next step',
              style: GoogleFonts.robotoFlex(
                  fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      swap1++;
                      swap1 = swap1 % 3;
                    });
                  },
                  child: swapWidget1,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      swap2++;
                      swap2 = swap2 % 3;
                    });
                  },
                  child: swapWidget2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      swap3++;
                      swap3 = swap3 % 3;
                    });
                  },
                  child: swapWidget3,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      swap4++;
                      swap4 = swap4 % 3;
                    });
                  },
                  child: swapWidget4,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      swap5++;
                      swap5 = swap5 % 3;
                    });
                  },
                  child: swapWidget5,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
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
                if (swap1 == 1 &&
                    swap2 == 1 &&
                    swap3 == 2 &&
                    swap4 == 2 &&
                    swap5 == 2) {
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
                                                  DragScreen(),
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
                    var ref = myRef.child(uid);
                    ref.update({
                      "levelsBubble": 8,
                    });
                    levelBubble = 8;
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
                                                  Level2dPage(),
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
          ]),
        ));
  }
}
