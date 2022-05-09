import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function handler;
  final List<Map<String, Object>> questions;
  final int index;

  Quiz({required this.handler, required this.questions, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(
          questions[index]['question'] as String,
        ),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          if (answer['score'] == 1) {
            return Answer(() => handler(answer['score']),
                (answer['ans'] as String), Colors.green);
          } else {
            return Answer(() => handler(answer['score']),
                (answer['ans'] as String), Colors.red);
          }
        }).toList()
      ],
    ));
  }
}
