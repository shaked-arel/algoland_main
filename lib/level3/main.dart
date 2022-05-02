import 'package:flutter/material.dart';
import 'draggableNumbers.dart';
import 'dragableWidget.dart';

void main() => runApp(DragApp());

class DragApp extends StatelessWidget {
  const DragApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragScreen(),
    );
  }
}

class DragScreen extends StatefulWidget {
  const DragScreen({Key? key}) : super(key: key);

  @override
  _DragScreenState createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  bool insideTarget = false;
  String activeEmoji = '';
  final Map<String, bool> score = {};
  final Map choises = {'15': 1, '24': 2, '47': 3, '66': 4, '88': 5};

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
        });
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
                  ArrayWidget(),
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
                _buildDragTarget('15'),
                _buildDragTarget('24'),
                _buildDragTarget('35'),
                _buildDragTarget('47'),
                _buildDragTarget('84'),
              ],
            ),
            DraggableNumbers()
          ],
        ),
      ),
    );
  }
}

class ArrayWidget extends StatelessWidget {
  const ArrayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          width: 70,
          height: 70,
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
                      child: Text(
                    "15",
                    style: TextStyle(fontSize: 40),
                  )))),
        ),
        SizedBox(
          width: 70,
          height: 70,
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
                      child: Text(
                    "24",
                    style: TextStyle(fontSize: 40),
                  )))),
        ),
        SizedBox(
          width: 85,
          height: 85,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "47",
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  )))),
        ),
        SizedBox(
          width: 85,
          height: 85,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "35",
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  )))),
        ),
        SizedBox(
          width: 70,
          height: 70,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "84",
                    style: TextStyle(fontSize: 40, color: Colors.orange),
                  )))),
        ),
      ],
    );
  }
}
