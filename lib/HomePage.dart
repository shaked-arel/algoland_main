import 'package:binarysearch/Alg.dart';
import 'package:binarysearch/BubbleSortTransition.dart';
import 'package:flutter/material.dart';
import 'Alg.dart';
import './auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => AuthGate()));
          },
          tooltip: 'Next Page',
          child: IconTheme(
            data: new IconThemeData(
              color: Colors.blue,
            ),
            child: new Icon(Icons.arrow_forward),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Center(
          child: Text(
            'Welcome to Algoland',
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 0),
          ),
        )),
      );
}
