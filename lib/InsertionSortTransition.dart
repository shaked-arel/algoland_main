import 'package:binarysearch/config/palette.dart';
import 'package:binarysearch/quizInsertionSort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';
import 'InsertionSortGame.dart';
import 'InsertionSortSimulation.dart';

class InsertionSortTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white12,
      elevation: 0,
      title: Text(
        'What would you like to do?',
        style: TextStyle(
            color: Palette.darkBlue2, fontSize: 20, fontFamily: 'Calibri'),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.blueAccent,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    body: const Center(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: const Alignment(0.5, 1.15), // top left
          // child: Material(
          //     elevation: 0,
          //     child: Image.asset('assets/popup.png', width: 190)),
          child: PopupItemLauncher(
            tag: 'test',
            child: Align(
              alignment: const Alignment(0.5, 1.15), // top left
              child: Material(
                  elevation: 0,
                  child: Image.asset('assets/popup.png', width: 190)),
            ),
            popUp: PopUpItem(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              elevation: 2,
              tag: 'test',
              child: PopUpItemBody(),
              //PopUpItemBody(),
            ),
          ),
        ),


        Align(
          alignment: const Alignment(0,-0.6), // top left
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
              onPressed: () {Navigator.push(
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
          // const Divider(
          //   color: Colors.white,
          //   thickness: 0.2,
          // ),
          const TextField(
            decoration: InputDecoration(
              hintText:'In an insertion sort, each element in the array is checked with the'
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

