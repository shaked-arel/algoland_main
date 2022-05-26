import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../backButton.dart';
import '../../normalNumber.dart';
import '../../sortNumber.dart';
import '../../sortedNumber.dart';
import 'draggableNumbers.dart';
import 'dragableWidget.dart';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DragScreen2 extends StatefulWidget {
  const DragScreen2({Key? key}) : super(key: key);

  @override
  _DragScreen2State createState() => _DragScreen2State();
}

class _DragScreen2State extends State<DragScreen2>
    with TickerProviderStateMixin {
  bool insideTarget = false;
  bool isVisible = false;
  String activeEmoji = '';
  final Map<String, bool> score = {};
  //final Map choises = {'15': 1, '24': 2, '47': 3, '66': 4, '88': 5};

  //controller
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildDragTarget(number) {
    return DragTarget<String>(
      builder: (context, data, rejectedDate) {
        if (score[number] == true) {
          return SizedBox(
              width: 75,
              height: 75,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(
                          child:
                              Text(number, style: TextStyle(fontSize: 40))))));
        } else {
          return SizedBox(
              width: 75,
              height: 75,
              child: Container(color: Colors.grey.shade200));
        }
      },
      onAccept: (number) {
        setState(() {
          score[number] = true;
          if (score.length == 5) {
            _controller.forward();
            isVisible = !isVisible;
            final FirebaseAuth auth = FirebaseAuth.instance;
            final User user = auth.currentUser!;
            final uid = user.uid;
            FirebaseDatabase database = FirebaseDatabase.instance;
            DatabaseReference myRef =
                FirebaseDatabase.instance.ref("progress/user");
            var ref = myRef.child(uid);
            ref.update({
              "levelsBubble": 10,
            });
            levelBubble = 10;
          }
        });
        //sound affects goes here
      },
      onWillAccept: (data) {
        return number == data;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score ${score.length} / 5'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      NormalFormNumber(number: '7'),
                      SortNumber(number: '24'),
                      SortNumber(number: '12'),
                      SortedNumber(number: '47'),
                      SortedNumber(number: '84'),
                    ],
                  ),
                  Text(
                    "what would be the array one step after?",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildDragTarget('7'),
                _buildDragTarget('12'),
                _buildDragTarget('24'),
                _buildDragTarget('47'),
                _buildDragTarget('84'),
              ],
            ),
            Container(
              height: 200,
              child: Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_wys2rrr6.json',
                  controller: _controller,
                  height: 200,
                  repeat: false),
            ),
            DraggableNumbers(),
            Visibility(
              visible: isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text('Finish')),
            ),
            AllBackButton()
          ],
        ),
      ),
    );
  }
}
