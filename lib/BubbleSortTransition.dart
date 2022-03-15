import 'package:binarysearch/BubbleSortSimulation.dart';
import 'package:binarysearch/quizBubbleSort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BubbleSortTransition extends StatelessWidget {
  @override
    Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('appBarTitle', style: TextStyle(
          color: Colors.white, fontSize: 20,  fontFamily: 'Calibri'),
      ),
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); },),
    ),
      body: const Center(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: new Alignment(0, -0.5), // top left
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
              ),
              width:150.0,
              height:150.0,
              child: new RawMaterialButton(
                shape: new CircleBorder(),
                elevation: 0.0,
                child: Text(
                  'Questions',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20,  fontFamily: 'Calibri'),
                ),
                onPressed: () {
                  runApp(quizBubbleSort());
                },
              ),
            ),
          ),
          Align(

            alignment: new Alignment(0, 0.25), // center right
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
              ),
              width:150.0,
              height:150.0,
              child: new RawMaterialButton(
                shape: new CircleBorder(),
                elevation: 0.0,
                child: Text(
                  'Simulation',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20,  fontFamily: 'Calibri'),
                ),
                onPressed: () {
                  runApp(BubbleSortSimulation());
                },
              ),
            ),
          ),
          Align(

            alignment: new Alignment(0, 1), // center right
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
              ),
              width:150.0,
              height:150.0,
              child: new RawMaterialButton(
                shape: new CircleBorder(),
                elevation: 0.0,
                child: Text(
                  'Game',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20,  fontFamily: 'Calibri'),
                ),
                onPressed: () {
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


