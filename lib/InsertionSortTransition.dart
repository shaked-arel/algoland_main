import 'package:binarysearch/config/palette.dart';
import 'package:binarysearch/quizInsertionSort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'InsertionSortGame.dart';
import 'InsertionSortSimulation.dart';

class InsertionSortTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Insertion Sort',
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
                        title: Text('Insertion Sort algorithm', style: GoogleFonts.robotoFlex(color: Palette.orange, fontWeight: FontWeight.bold),),
                        content:
                        Container(
                            width: 200,
                            height: 295,
                            child: Column(
                              children: <Widget>[
                                Text('In an insertion sort, each element in the array is checked with the'
                                    ' previous elements. '
                                    'The sorting algorithm removes one element at a time and finds'
                                    ' the appropriate location within the sorted array, and inserts it there.', style: GoogleFonts.robotoFlex(fontSize: 18),),
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
              // child: Material(
              //     elevation: 0,
              //     child: Image.asset('assets/popup.png', width: 190)),
              // child: PopupItemLauncher(
              //   tag: 'test',
              //   child: Align(
              //     alignment: const Alignment(0.5, 1.15), // top left
              //     child: Material(
              //         elevation: 0,
              //         child: Image.asset('assets/popup1.png', width: 200)),
              //   ),
              //   popUp: PopUpItem(
              //     padding: EdgeInsets.all(8),
              //     color: Colors.white,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(32)),
              //     elevation: 2,
              //     tag: 'test',
              //     child: PopUpItemBody(),
              //     //PopUpItemBody(),
              //   ),
              // ),
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
                            builder: (context) => InsertionSortSimulation()));
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
                            builder: (context) => quizInsertionSort()));
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

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText:
                  'In an insertion sort, each element in the array is checked with the'
                  ' previous elements. '
                  'With each iteration, the sorting algorithm removes one element at a time and finds'
                  ' the appropriate location within the sorted array and inserts it there.',
              border: InputBorder.none,
            ),
            cursorColor: Colors.white,
            maxLines: 7,
          ),
          // const Divider(
          //   color: Colors.white,
          //   thickness: 0.2,
          // ),
        ],
      ),
    );
  }
}
