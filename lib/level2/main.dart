import 'package:flutter/material.dart';
import '../normalNumber.dart';
import '../sortNumber.dart';
import '../sortedNumber.dart';

class Level2Page extends StatefulWidget {
  final bool swap;

  Level2Page({required this.swap});

  @override
  State<Level2Page> createState() => _Level2State();
}

class _Level2State extends State<Level2Page> {
  bool swap = false;

  int swap1 = 0;
  int swap2 = 0;
  int swap3 = 0;
  int swap4 = 0;
  int swap5 = 0;

  @override
  void initState() {
    swap = widget.swap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttonTile = ListTile(
      title: RaisedButton(
        child: Text("Swap Widget"),
        onPressed: () {
          setState(() {
            swap = !swap;
          });
        },
      ),
    );

    Widget swapWidget;
    if (swap) {
      swapWidget = NormalFormNumber(number: "23");
    } else {
      swapWidget = SortNumber(number: "23");
    }

    Widget swapWidget2;
    if (swap2 == 0) {
      swapWidget2 = NormalFormNumber(number: "15");
    } else {
      if (swap2 == 1) {
        swapWidget2 = SortNumber(number: "15");
      } else {
        swapWidget2 = SortedNumber(number: "15");
      }
    }

    Widget swapWidget3;
    if (swap3 == 0) {
      swapWidget3 = NormalFormNumber(number: "32");
    } else {
      if (swap3 == 1) {
        swapWidget3 = SortNumber(number: "32");
      } else {
        swapWidget3 = SortedNumber(number: "32");
      }
    }

    Widget swapWidget1;
    if (swap1 == 0) {
      swapWidget1 = NormalFormNumber(number: "4");
    } else {
      if (swap1 == 1) {
        swapWidget1 = SortNumber(number: "4");
      } else {
        swapWidget1 = SortedNumber(number: "4");
      }
    }

    Widget swapWidget4;
    if (swap4 == 0) {
      swapWidget4 = NormalFormNumber(number: "27");
    } else {
      if (swap4 == 1) {
        swapWidget4 = SortNumber(number: "27");
      } else {
        swapWidget4 = SortedNumber(number: "27");
      }
    }

    Widget swapWidget5;
    if (swap5 == 0) {
      swapWidget5 = NormalFormNumber(number: "40");
    } else {
      if (swap5 == 1) {
        swapWidget5 = SortNumber(number: "40");
      } else {
        swapWidget5 = SortedNumber(number: "40");
      }
    }

    var swapTile = ListTile(
      title: swapWidget,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Swap Widget example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NormalFormNumber(number: "4"),
              SortNumber(number: "15"),
              SortNumber(number: "32"),
              NormalFormNumber(number: "27"),
              SortedNumber(number: "40"),
            ],
          ),
          Text(
            "Click to change the array to fit the next step",
            style: TextStyle(fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    swap1++;
                    swap1 = swap1 % 3;
                  });
                },
                child: swapWidget1,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    swap2++;
                    swap2 = swap2 % 3;
                  });
                },
                child: swapWidget2,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    swap3++;
                    swap3 = swap3 % 3;
                  });
                },
                child: swapWidget3,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    swap4++;
                    swap4 = swap4 % 3;
                  });
                },
                child: swapWidget4,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    swap5++;
                    swap5 = swap5 % 3;
                  });
                },
                child: swapWidget5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
