import 'package:binarysearch/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './quiz.dart';
import './result.dart';

class quizBinarySearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizState();
    //throw UnimplementedError();
  }
}

class _QuizState extends State<quizBinarySearch> {
  final _questions = [
    {
      'question': 'Is it possible to apply binary search to an unsorted array?',
      'answers': [
        {'ans': 'Yes', 'score': 0},
        {'ans': 'No, first we need to sort the array', 'score': 1},
      ]
    },
    {
      'question': 'What is the time complexity of the algorithm?',
      'answers': [
        {'ans': 'O(log n)', 'score': 1},
        {'ans': 'O(nlog n)', 'score': 0},
        {'ans': 'O(n)', 'score': 0},
        {'ans': 'O(log^2 n)', 'score': 0},
      ]
    },
    {
      'question': 'What will be the size of the array after k iterations?',
      'answers': [
        {'ans': 'k', 'score': 0},
        {'ans': 'n/k', 'score': 0},
        {'ans': 'n/2^k', 'score': 1},
        {'ans': 'k/2', 'score': 0},
      ]
    },
    {
      'question':
          'A=[2, 6, 7, 8, 40, 55, 160, 170, 177, 200],'
              ' After how many iterations will the algorithm return the value 7?',
      'answers': [
        {'ans': '1', 'score': 0},
        {'ans': '2', 'score': 0},
        {'ans': '3', 'score': 1},
        {'ans': '4', 'score': 0},
      ]
    },
    {
      'question': 'A=[15, 18, 20, 21, 26, 31, 36, 38], '
          ' B=[20, 21, 26, 31, 36, 38, 40]' + '\r\n'
          'What will be the number from which we will start the search?',
      'answers': [
        {'ans': 'A: 21, B: 26', 'score': 0},
        {'ans': 'A: 26, B: 36', 'score': 0},
        {'ans': 'A: 26, B: 31', 'score': 0},
        {'ans': 'A: 21, B: 31', 'score': 1},
      ]
    },
  ];
  var _qIndex = 0;
  var _totalScore = 0;
  var _curscore = -1;

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
      _curscore = -1;
    });
  }

  void _answer(int score) {
    _curscore = score;
    _totalScore += score;
    setState(() {
      _qIndex += 1;
    });
    if (_qIndex < _questions.length) {
      print("we have more questions");
    }
    print("answer chosen");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Quiz", style: GoogleFonts.robotoFlex(fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white, // appbar color.
            foregroundColor: Palette.darkBlue2, // appbar text color.
          ),
          body: _qIndex < _questions.length
              ? Quiz(handler: _answer, questions: _questions, index: _qIndex, score: _curscore)
              : Result(_totalScore, _resetQuiz, _questions.length, "binary"),),);
  }
}
