import 'package:binarysearch/config/palette.dart';
import 'package:binarysearch/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int numOfQuestions;
  final VoidCallback reset;
  final String name;

  Result(this.resultScore, this.reset, this.numOfQuestions, this.name);

  String get resultPhrase {
    String resultText;
    resultText = '';
    //+
    // resultScore.toString() +
    // '/' +
    // numOfQuestions.toString() +
    // ' correct answers';
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
    switch (name) {
      case "bubble":
        {
          if (precentBubble < resultScore * 20) {
            ref.update({
              "bubble": (resultScore * 20),
            });
            precentBubble = resultScore * 20;
          }
          break;
        }
      case "insertion":
        {
          if (precentInsertion < resultScore * 20) {
            ref.update({
              "insertion": (resultScore * 20),
            });
            precentInsertion = resultScore * 20;
          }
          break;
        }
      case "binary":
        {
          if (precentBinary < resultScore * 20) {
            ref.update({
              "binary": (resultScore * 20),
            });
            precentBinary = resultScore * 20;
          }
          break;
        }
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Text(
          'You were able to answer ',
          style:
              GoogleFonts.robotoFlex(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.center,
          child: CircularPercentIndicator(
            radius: 90,
            percent: resultScore * 20 / 100,
            lineWidth: 6,
            backgroundColor: Palette.lightgray,
            progressColor: Palette.yellow,
            center: new Text(resultScore.toString() + '/' + '5',
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Palette.yellow)),
          ),
        ),
        Text(
          resultPhrase,
          style:
              GoogleFonts.robotoFlex(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        FlatButton(
          onPressed: reset,
          child:
              Text('restart Quiz', style: GoogleFonts.robotoFlex(fontSize: 18)),
          textColor: Palette.darkBlue2,
        )
      ]),
    );
  }
}
