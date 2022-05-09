import 'package:binarysearch/BinarySearchTransition.dart';
import 'package:binarysearch/wait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'BubbleSortTransition.dart';
import 'InsertionSortTransition.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Algorithms extends StatelessWidget {
  final databaseRef = FirebaseDatabase.instance.ref("progress/user");
  static int percent1 = 0;
  static int percent2 = 0;
  static int percent3 = 0;

  Future<int> getPer1() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("bubble")
          .get();
      print(snapshot.value);
      int num = int.parse(snapshot.value.toString());
      assert(num is int);
      return num;
    } catch (err) {
      rethrow;
    }
  }

  Future<int> getPer2() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("insertion")
          .get();
      print(snapshot.value);
      int num = int.parse(snapshot.value.toString());
      assert(num is int);
      return num;
    } catch (err) {
      rethrow;
    }
  }

  Future<int> getPer3() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("binary")
          .get();
      print(snapshot.value);
      int num = int.parse(snapshot.value.toString());
      assert(num is int);
      return num;
    } catch (err) {
      rethrow;
    }
  }

  void get() async {
    percent1 = await getPer1();
    percent2 = await getPer2();
    percent3 = await getPer3();
  }

  @override
  Widget build(BuildContext context) {
    get();
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
                              percent: percent1 / 100,
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
                                  get();
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
                              percent: percent2 / 100,
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
                                  get();
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
                              percent: percent3 / 100,
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
                                  get();
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
