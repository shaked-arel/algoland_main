import 'package:binarysearch/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function handler;
  final List<Map<String, Object>> questions;
  final int index;
  final int score;

  Quiz({required this.handler, required this.questions, required this.index,required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Column(
          children: [
        SizedBox(height: 15),
        Align(
          alignment: Alignment.center,
          child: CircularPercentIndicator(
            radius: 60,
            percent: index*20 / 100,
            lineWidth: 6,
            backgroundColor: Palette.lightgray,
            progressColor: Palette.yellow,
            center: new Text(index.toString() + '/' + '5',
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.bold,
                    color: Palette.yellow)),
          ),
        ),
            Question(
              questions[index]['question'] as String,
            ),
            ...(questions[index]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              if (answer['score'] == 1) {
                return Answer(() => handler(answer['score']),
                    (answer['ans'] as String), Palette.green);
              } else {
                return Answer(() => handler(answer['score']),
                    (answer['ans'] as String), Colors.red);
              }
            }).toList(),
          ],),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          if (score == 1) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/true.png'),
            );
          }
          if (score == 0) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/false.png'),
            );
          } else {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/question.png'),
            );
          }
        }),
      ],
    ));
  }
}
