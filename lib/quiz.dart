import 'package:binarysearch/other/image.dart';
import '../config/palette.dart';
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

  Quiz(
      {required this.handler,
      required this.questions,
      required this.index,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                radius: 80,
                percent: index * 20 / 100,
                lineWidth: 8,
                backgroundColor: Palette.lightgray,
                progressColor: Palette.yellow,
                center: new RichText(
              text: TextSpan(
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.bold, color: Palette.lightgray, fontSize: 37),
              children: <TextSpan>[
                TextSpan(text: index.toString(), style: GoogleFonts.robotoFlex(color: Palette.yellow)),
                TextSpan(text: '/' + '5',),
              ],
            ),
    )
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
          ],
        ),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          if (score == 1) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(Images.trueAns),
            );
          }
          if (score == 0) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(Images.falseAns),
            );
          } else {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(Images.question),
            );
          }
        }),
      ],
    ));
  }
}
