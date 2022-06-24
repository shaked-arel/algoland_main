import 'package:binarysearch/config/palette.dart';
import 'package:binarysearch/quizBinarySearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'BinarySearchSimulation.dart';
import 'BinarySearchGame.dart';

class BinarySearchTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Binary Search',
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
        body: const Center(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: const Alignment(0.3, 1.02), // top left
              child: RawMaterialButton(
                shape: const ContinuousRectangleBorder(
                  borderRadius: const BorderRadius.only(),
                ),
                child: Image.asset(
                  'assets/popup.png',
                  width: 200,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Color(0xfbfbfbfb),
                            title: Text(
                              'Binary Search algorithm',
                              style: GoogleFonts.robotoFlex(
                                  color: Palette.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                                width: 200,
                                height: 252,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Binary Search works by repeatedly dividing in half the portion'
                                      ' of the list that could contain the item,'
                                      ' until you have narrowed down the possible locations to just one.',
                                      style:
                                          GoogleFonts.robotoFlex(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset("assets/dialog.png"),
                                    ),
                                  ],
                                )),
                          ));
                },
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.6), // top left
              child: Container(
                // margin: const EdgeInsets.all(5.0),
                width: 310.0,
                height: 165.0,
                //color: Colors.transparent,
                child: new RawMaterialButton(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: const BorderRadius.only(),
                  ),
                  child: Image.asset('assets/simulation.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BinarySearchSimulation()));
                  },
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.01), // top left
              child: Container(
                // margin: const EdgeInsets.all(5.0),
                width: 320.0,
                height: 165.0,
                //color: Colors.transparent,
                child: new RawMaterialButton(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: const BorderRadius.only(),
                  ),
                  child: Image.asset('assets/quiz.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => quizBinarySearch()));
                  },
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.6), // top left
              child: Container(
                // margin: const EdgeInsets.all(5.0),
                width: 310.0,
                height: 165.0,
                //color: Colors.transparent,
                child: new RawMaterialButton(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: const BorderRadius.only(),
                  ),
                  child: Image.asset('assets/game.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BinaryTodoScreen(
                                  levels: List.generate(
                                    7,
                                    (index) => Todo(
                                        title: 'Level ${index + 1} ',
                                        description:
                                            "description for level $index"),
                                  ),
                                )));
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
