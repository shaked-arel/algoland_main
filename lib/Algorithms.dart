import 'package:binarysearch/BinarySearchTransition.dart';
import 'package:binarysearch/global.dart';
import 'package:binarysearch/wait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'BubbleSortTransition.dart';
import 'InsertionSortTransition.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global.dart';

class Algorithms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose an algorithem',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Calibri'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 150.0,
                      child: Stack(children: <Widget>[
                        Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            child: CircularPercentIndicator(
                              radius: 150,
                              percent: precentBubble / 100,
                              animation: true,
                              lineWidth: 10,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                          ),
                        ),
                        Center(
                          child: ButtonTheme(
                              minWidth: 125.0,
                              height: 125.0,
                              buttonColor: Colors.white54,
                              child: RaisedButton(
                                shape: new CircleBorder(),
                                elevation: 0.0,
                                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                child: Text(
                                  'Bubble Sort',
                                  style: TextStyle(
                                      //color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Calibri'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              BubbleSortTransition()));
                                },
                              )),
                        ),
                      ])),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 150.0,
                      child: Stack(children: <Widget>[
                        Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            child: CircularPercentIndicator(
                              radius: 150,
                              percent: precentInsertion / 100,
                              animation: true,
                              lineWidth: 10,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                          ),
                        ),
                        Center(
                          child: ButtonTheme(
                              minWidth: 125.0,
                              height: 125.0,
                              buttonColor: Colors.white54,
                              child: RaisedButton(
                                shape: new CircleBorder(),
                                elevation: 0.0,
                                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                child: Text(
                                  'Insertion Sort',
                                  style: TextStyle(
                                      //color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Calibri'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              InsertionSortTransition()));
                                },
                              )),
                        ),
                      ])),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 150.0,
                      child: Stack(children: <Widget>[
                        Center(
                          child: Container(
                            //width: 160,
                            //height: 160,
                            child: CircularPercentIndicator(
                              radius: 150,
                              percent: precentBinary / 100,
                              animation: true,
                              lineWidth: 10,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                          ),
                        ),
                        Center(
                          child: ButtonTheme(
                              minWidth: 125.0,
                              height: 125.0,
                              buttonColor: Colors.white54,
                              child: RaisedButton(
                                shape: new CircleBorder(),
                                elevation: 0.0,
                                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                child: Text(
                                  'Binary Search',
                                  style: TextStyle(
                                      //color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Calibri'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              BinarySearchTransition()));
                                },
                              )),
                        ),
                      ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
