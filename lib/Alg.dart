import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BinarySearchTransition.dart';
import 'BubbleSortTransition.dart';
import 'InsertionSortTransition.dart';

class Alg extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'appBarTitle',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Calibri'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // backgroundColor: Colors.white,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        //   tooltip:'Next Page',
        //   child: IconTheme(
        //     data: new IconThemeData(
        //       color: Colors.blue,
        //     ),
        //     child: new Icon(Icons.arrow_back),
        //   ),
        //   backgroundColor: Colors.white,
        // ),

        body: const Center(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: new Alignment(-0.5, -0.5), // top left
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
                width: 150.0,
                height: 150.0,
                child: new RawMaterialButton(
                  shape: new CircleBorder(),
                  elevation: 0.0,
                  child: Text(
                    'Bubble Sort',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Calibri'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BubbleSortTransition()));
                  },
                ),
              ),
            ),
            Align(
              alignment: new Alignment(0.5, 0.25), // center right
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
                width: 150.0,
                height: 150.0,
                child: new RawMaterialButton(
                  shape: new CircleBorder(),
                  elevation: 0.0,
                  child: Text(
                    'Insertion Sort',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Calibri'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => InsertionSortTransition()));
                  },
                ),
              ),
            ),
            Align(
              alignment: new Alignment(-0.5, 1), // center right
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
                width: 150.0,
                height: 150.0,
                child: new RawMaterialButton(
                  shape: new CircleBorder(),
                  elevation: 0.0,
                  child: Text(
                    'Binary Search',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Calibri'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BinarySearchTransition()));
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
