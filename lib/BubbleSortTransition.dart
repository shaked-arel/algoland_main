import 'package:binarysearch/config/palette.dart';
import 'package:binarysearch/quizBubbleSort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'BubbleSortGame.dart';
import 'BubbleSortSimulation.dart';

class BubbleSortTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Bubble Sort',
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
              alignment: const Alignment(0.3, 1.02),
              child: RawMaterialButton(
                shape: const ContinuousRectangleBorder(
                  borderRadius: const BorderRadius.only(),
                ),
                child: Image.asset('assets/popup.png', width: 200,),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color(0xfbfbfbfb),
                        title: Text('Bubble Sort algorithm', style: GoogleFonts.robotoFlex(color: Palette.orange, fontWeight: FontWeight.bold),),
                        content:
                        Container(
                            width: 200,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text( 'Bubble Sort is the simplest sorting algorithm that works by'
                            ' repeatedly swapping the adjacent elements if they are in wrong order.', style: GoogleFonts.robotoFlex(fontSize: 18),),
                                SizedBox(height: 13,),
                                Align(alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                      "assets/dialog.png"),),
                              ],
                            )
                        ),
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
                            builder: (context) => BubbleSortSimulation()));
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
                            builder: (context) => quizBubbleSort()));
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
                            builder: (context) => TodoScreen(
                                  levels: List.generate(
                                    10,
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

