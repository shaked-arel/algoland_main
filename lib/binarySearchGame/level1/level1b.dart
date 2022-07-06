import 'package:binarysearch/global.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../backButton.dart';
import '../../config/palette.dart';
import '../../openNumber.dart';
import '../../searchNumber.dart';
import 'package:flutter/material.dart';

import '../level1/level1c.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../global.dart';

class Level1bPage extends StatefulWidget {
  @override
  State<Level1bPage> createState() => _Level1bPageState();
}

class _Level1bPageState extends State<Level1bPage>
    with TickerProviderStateMixin {
  Color col = Palette.yellow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Level 2",
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
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              'You are searching for',
              style: GoogleFonts.robotoFlex(
                  fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                    child: Text(
                  '71',
                  style: GoogleFonts.robotoFlex(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Palette.yellow),
                  textAlign: TextAlign.center,
                ))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 350,
                height: 80,
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
                        openNumber(number: '22'),
                        openNumber(number: '29'),
                        searchNumber(number: '46'),
                        openNumber(number: '83'),
                        openNumber(number: '94'),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              'press if you should look right or left',
              style: GoogleFonts.robotoFlex(
                  fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    color: col,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      'Left',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
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
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Level1bPage()));
                                            // Navigator.push(
                                            //     context,
                                            //     new MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           Level1bPage(),
                                            //     ));
                                          },
                                        ),
                                      ),
                                      AllBackButton(),
                                    ],
                                  )
                                ],
                              ));
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    color: col,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      'Right',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
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
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Level1cPage()));
                                            // Navigator.push(
                                            //     context,
                                            //     new MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           Level1cPage(),
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
                        var ref = myRef.child(uid).child("levelsBinary");
                        ref.update({
                          "1": 1,
                        });
                        levelsBinary[1] = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
