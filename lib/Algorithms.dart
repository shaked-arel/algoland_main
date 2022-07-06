import 'package:binarysearch/BinarySearchTransition.dart';
import 'package:binarysearch/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'BubbleSortTransition.dart';
import 'InsertionSortTransition.dart';
import 'global.dart';

class Algorithms extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Algoland',
              style: GoogleFonts.robotoFlex(
                  color: Palette.darkBlue2, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Palette.darkBlue2,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          // appbar color.
          foregroundColor: Palette.darkBlue2, // appbar text color.
        ),
        body: ListView(
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(0),
              crossAxisCount: 1,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Palette.orange1,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(0, -0.9),
                        child: Text(
                          'Bubble Sort',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoFlex(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.63, -0.7),
                        child: Image.asset('assets/robot1.png', width: 70),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CircularPercentIndicator(
                            radius: 200,
                            percent: precentBubble / 100,
                            animation: true,
                            lineWidth: 30,
                            backgroundColor: Palette.lightgray,
                            progressColor: Palette.yellow,
                            center: Text(precentBubble.toString() + '%',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.robotoFlex(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45.0,
                                    color: Palette.yellow)),
                          ),),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(18.0),
                              primary: Colors.white,
                              textStyle: GoogleFonts.robotoFlex(fontSize: 20),
                              backgroundColor: Palette.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Algorithms()));
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        BubbleSortTransition()));
                          },
                          child: Text(
                            "Let's practice",
                            style: GoogleFonts.robotoFlex(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Palette.orange2,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(0, -0.9),
                        child: Text('Insertion Sort',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoFlex(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                      ),
                      Align(
                        alignment: Alignment(-0.7, -0.63),
                        child: Image.asset('assets/robot2.png', width: 70),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircularPercentIndicator(
                          radius: 200,
                          percent: precentInsertion / 100,
                          animation: true,
                          lineWidth: 30,
                          backgroundColor: Palette.lightgray,
                          progressColor: Colors.orange,
                          center: new Text(precentInsertion.toString() + '%',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoFlex(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45.0,
                                  color: Colors.orange)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(18.0),
                              primary: Colors.white,
                              textStyle: GoogleFonts.robotoFlex(fontSize: 20),
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Algorithms()));
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        InsertionSortTransition()));
                          },
                          child: Text(
                            "Let's practice",
                            style: GoogleFonts.robotoFlex(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Palette.blue2,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(0, -0.9),
                        child: Text('Binary Search',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoFlex(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                      ),
                      Align(
                        alignment: Alignment(0.63, -0.7),
                        child: Image.asset('assets/robot1.png', width: 70),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircularPercentIndicator(
                          radius: 200,
                          percent: precentBinary / 100,
                          animation: true,
                          lineWidth: 30,
                          backgroundColor: Palette.lightgray,
                          progressColor: Palette.lightBlue2,
                          center: new Text(precentBinary.toString() + '%',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoFlex(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45.0,
                                  color: Palette.lightBlue2)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(18.0),
                              primary: Colors.white,
                              textStyle: GoogleFonts.robotoFlex(fontSize: 20),
                              backgroundColor: Palette.lightBlue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Algorithms()));
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        BinarySearchTransition()));
                          },
                          child: Text(
                            "Let's practice",
                            style: GoogleFonts.robotoFlex(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
