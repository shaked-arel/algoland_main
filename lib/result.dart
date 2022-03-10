import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int numOfQuestions;
  final VoidCallback reset;

  Result(this.resultScore, this.reset, this.numOfQuestions);

  String get resultPhrase {
    String resultText;
    // if (resultScore <= 8) {
    //   resultText = 'you are amazing!';
    // } else if (resultScore <= 12) {
    //   resultText = 'greate job!';
    // } else {
    //   resultText = 'try again...';
    // }
    resultText = 'You were able to answer ' + resultScore.toString()
        + '/' + numOfQuestions.toString() + ' correct answers';
    if (resultScore < numOfQuestions){
      resultText += "\r\n" "\r\n" 'Try again!';
    } else {
      resultText += "\r\n" "\r\n" 'Great job!';
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