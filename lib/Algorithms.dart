import 'package:binarysearch/BinarySearchTransition.dart';
import 'package:binarysearch/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'BubbleSortTransition.dart';
import 'InsertionSortTransition.dart';
import 'global.dart';

class Algorithms extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          elevation: 0,
          title: Text(
            'Algoland',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Palette.lightBlue2, fontSize: 20, fontFamily: 'Calibri'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Palette.lightBlue2,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(0),
              //crossAxisSpacing: 2,
              //mainAxisSpacing: 2,
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
                          'Bubble sort',
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                          center: new Text(precentBubble.toString() + '%',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45.0,
                                  color: Palette.yellow)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(18.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Palette.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        BubbleSortTransition()));
                          },
                          child: const Text(
                            "Let's practice",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                        child: Text('Insertion sort',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                          percent: precentBubble / 100,
                          animation: true,
                          lineWidth: 30,
                          backgroundColor: Palette.lightgray,
                          progressColor: Colors.orange,
                          center: new Text(precentBubble.toString() + '%',
                              style: new TextStyle(
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
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        InsertionSortTransition()));
                          },
                          child: const Text(
                            "Let's practice",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                        child: Text('Binary search',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                          percent: precentBubble / 100,
                          animation: true,
                          lineWidth: 30,
                          backgroundColor: Palette.lightgray,
                          progressColor: Palette.lightBlue2,
                          center: new Text(precentBubble.toString() + '%',
                              style: new TextStyle(
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
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Palette.lightBlue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        BinarySearchTransition()));
                          },
                          child: const Text(
                            "Let's practice",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
