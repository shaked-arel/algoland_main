import 'package:binarysearch/quizBinarySearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';
import 'BinarySearchSimulation.dart';
import 'StartGame.dart';

class BinarySearchTransition extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('appBarTitle', style: TextStyle(
          color: Colors.white, fontSize: 20,  fontFamily: 'Calibri'),
    ),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context); },),
    ),
    body: const Center(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Stack(
      fit: StackFit.expand,
      children: [
        PopupItemLauncher(
          tag: 'test',
          child: Align(
            alignment: new Alignment(1.2, -0.6), // top left
            child: Material(
              elevation: 0,
              child: const Icon(
                Icons.announcement_outlined,
                //Icons.add_rounded,
                size: 45,
              ),
            ),
          ),
          popUp: PopUpItem(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            elevation: 2,
            tag: 'test',
            child: PopUpItemBody(),
          ),
        ),
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
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => quizBinarySearch()));
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
              onPressed: () {Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => BinarySearchSimulation()));
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
              onPressed: () {Navigator.push(
      context,
      new MaterialPageRoute(
      builder: (context) => TodoScreen(levels:  List.generate(
        5,
            (index) => Todo(
            title: 'Level $index ',
            description: "description for level $index"),
      ),)));
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
              hintText: 'Binary search works by repeatedly dividing in half the portion'
                  ' of the list that could contain the item,'
                  ' until you have narrowed down the possible locations to just one.',
              border: InputBorder.none,
            ),
            cursorColor: Colors.white,
            maxLines: 6,
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
