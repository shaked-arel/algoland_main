import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../backButton.dart';
import '../level2b/level2b.dart';
import '../level3/main.dart';
import '../normalNumber.dart';
import '../sortNumber.dart';
import '../sortedNumber.dart';

class Level2Page extends StatefulWidget {
//  final bool swap;

  Level2Page();

  @override
  State<Level2Page> createState() => _Level2State();
}

class _Level2State extends State<Level2Page> with TickerProviderStateMixin {
  bool swap = false;
  bool isVisible = false;
  bool isVisibleGood = false;
  bool isVisibleBad = false;

  int swap1 = 0;
  int swap2 = 0;
  int swap3 = 0;
  int swap4 = 0;
  int swap5 = 0;

  //controller
  late final AnimationController _controller;
  late final AnimationController _WrongController;

  @override
  void initState() {
    super.initState();
    //  swap = widget.swap;
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _WrongController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _WrongController.dispose();
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

    Widget swapWidget2;
    if (swap2 == 0) {
      swapWidget2 = NormalFormNumber(number: "16");
    } else {
      if (swap2 == 1) {
        swapWidget2 = SortNumber(number: "16");
      } else {
        swapWidget2 = SortedNumber(number: "16");
      }
    }

    Widget swapWidget3;
    if (swap3 == 0) {
      swapWidget3 = NormalFormNumber(number: "53");
    } else {
      if (swap3 == 1) {
        swapWidget3 = SortNumber(number: "53");
      } else {
        swapWidget3 = SortedNumber(number: "53");
      }
    }

    Widget swapWidget1;
    if (swap1 == 0) {
      swapWidget1 = NormalFormNumber(number: "7");
    } else {
      if (swap1 == 1) {
        swapWidget1 = SortNumber(number: "7");
      } else {
        swapWidget1 = SortedNumber(number: "7");
      }
    }

    Widget swapWidget4;
    if (swap4 == 0) {
      swapWidget4 = NormalFormNumber(number: "29");
    } else {
      if (swap4 == 1) {
        swapWidget4 = SortNumber(number: "29");
      } else {
        swapWidget4 = SortedNumber(number: "29");
      }
    }

    Widget swapWidget5;
    if (swap5 == 0) {
      swapWidget5 = NormalFormNumber(number: "87");
    } else {
      if (swap5 == 1) {
        swapWidget5 = SortNumber(number: "87");
      } else {
        swapWidget5 = SortedNumber(number: "87");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Swap Widget example"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NormalFormNumber(number: "7"),
              NormalFormNumber(number: "16"),
              NormalFormNumber(number: "53"),
              SortNumber(number: "87"),
              SortNumber(number: "29"),
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
          Visibility(
            visible: isVisibleGood,
            child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_wys2rrr6.json',
                //  controller: _controller,
                height: 200,
                repeat: false),
          ),
          Visibility(
            visible: isVisibleBad,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_2frpohrv.json',
                //  controller: _WrongController,
                height: 200,
                repeat: false),
          ),
          ElevatedButton(
              onPressed: () {
                if (swap1 == 0 &&
                    swap2 == 0 &&
                    swap3 == 1 &&
                    swap4 == 1 &&
                    swap5 == 0) {
                  setState(() {
                    isVisibleGood = !isVisibleGood;
                    isVisible = !isVisible;
                  });
                } else {
                  setState(() {
                    isVisibleBad = !isVisibleBad;
                  });
                }
              },
              child: Text('Submit')),
          Visibility(
            visible: isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Level2bPage()));
                },
                child: Text('continue')),
          ),
          AllBackButton()
        ],
      ),
    );
  }
}
