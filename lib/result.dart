import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback reset;

  Result(this.resultScore, this.reset);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'you are amazing!';
    } else if (resultScore <= 12) {
      resultText = 'greate job!';
    } else {
      resultText = 'try again...';
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
