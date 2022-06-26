import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../backButton.dart';
import '../../config/palette.dart';
import '../../normalNumber.dart';
import '../../sortNumber.dart';
import '../../sortedNumber.dart';
import 'draggableNumbers.dart';
import 'dragableWidget.dart';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DragScreen2 extends StatefulWidget {
  const DragScreen2({Key? key}) : super(key: key);

  @override
  _DragScreen2State createState() => _DragScreen2State();
}

class _DragScreen2State extends State<DragScreen2>
    with TickerProviderStateMixin {
  Color col = Palette.orange;
  bool insideTarget = false;
  bool isVisible = false;
  String activeEmoji = '';
  final Map<String, bool> score = {};

  Widget _buildDragTarget(number) {
    return DragTarget<String>(
      builder: (context, data, rejectedDate) {
        if (score[number] == true) {
          return SizedBox(
              width: 75,
              height: 75,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(
                          child:
                              Text(number, style: TextStyle(fontSize: 40))))));
        } else {
          return SizedBox(
              width: 75,
              height: 75,
              child: Container(color: Colors.grey.shade200));
        }
      },
      onAccept: (number) {
        setState(() {
          score[number] = true;
          if (score.length == 5) {
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
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => DragScreen2(),
                                      ));
                                },
                              ),
                            ),
                            AllBackButton(),
                          ],
                        )
                      ],
                    ));
            final FirebaseAuth auth = FirebaseAuth.instance;
            final User user = auth.currentUser!;
            final uid = user.uid;
            FirebaseDatabase database = FirebaseDatabase.instance;
            DatabaseReference myRef =
                FirebaseDatabase.instance.ref("progress/user");
            var ref = myRef.child(uid).child("levelsBubble");
            ref.update({
              "9": 1,
            });
            levelsBubble[9] = 1;
          }
        });
        //sound affects goes here
      },
      onWillAccept: (data) {
        return number == data;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Level 10",
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.lightBlue2,
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              score.clear();
            });
          },
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/game-backg3.png'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
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
                            children: <Widget>[
                              NormalFormNumber(number: '7'),
                              SortNumber(number: '24'),
                              SortNumber(number: '12'),
                              SortedNumber(number: '47'),
                              SortedNumber(number: '84'),
                            ],
                          ),
                        ))),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'what would be the array one step after?',
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
                    _buildDragTarget('7'),
                    _buildDragTarget('12'),
                    _buildDragTarget('24'),
                    _buildDragTarget('47'),
                    _buildDragTarget('84'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                DraggableNumbers(),
              ],
            ),
          ),
        ));
  }
}
