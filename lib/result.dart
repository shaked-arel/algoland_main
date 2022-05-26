import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int numOfQuestions;
  final VoidCallback reset;
  final String name;

  Result(this.resultScore, this.reset, this.numOfQuestions, this.name);

  String get resultPhrase {
    String resultText;
    // if (resultScore <= 8) {
    //   resultText = 'you are amazing!';
    // } else if (resultScore <= 12) {
    //   resultText = 'greate job!';
    // } else {
    //   resultText = 'try again...';
    // }
    resultText = 'You were able to answer ' +
        resultScore.toString() +
        '/' +
        numOfQuestions.toString() +
        ' correct answers';
    if (resultScore < numOfQuestions) {
      resultText += "\r\n" "\r\n" 'Try again!';
    } else {
      resultText += "\r\n" "\r\n" 'Great job!';
    }
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    final uid = user.uid;
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference myRef = FirebaseDatabase.instance.ref("progress/user");
    var ref = myRef.child(uid);
    ref.update({
      name: (resultScore * 20),
    });
    switch (name) {
      case "bubble":
        {
          precentBubble = resultScore * 20;
          break;
        }
      case "insertion":
        {
          precentInsertion = resultScore * 20;
          break;
        }
      case "binary":
        {
          precentBinary = resultScore * 20;
          break;
        }
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed: reset,
          child: Text('restart Quiz'),
          textColor: Colors.blue,
        )
      ]),
    );
  }
}
