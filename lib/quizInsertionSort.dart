import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './quiz.dart';
import './result.dart';
import 'config/palette.dart';

class quizInsertionSort extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizState();
    //throw UnimplementedError();
  }
}

class _QuizState extends State<quizInsertionSort> {
  final _questions = [
    {
      'question':
          'What is the worst case time complexity of insertion sort assume naive case?',
      'answers': [
        {'ans': 'O(log(n))', 'score': 0},
        {'ans': 'O(nlog(n))', 'score': 0},
        {'ans': 'O(n)', 'score': 0},
        {'ans': 'O(n^2)', 'score': 1},
      ]
    },
    {
      'question':
          'What is the time complexity of insertion sort assume array already sorted?',
      'answers': [
        {'ans': 'O(log(n))', 'score': 0},
        {'ans': 'O(nlog(n))', 'score': 0},
        {'ans': 'O(n)', 'score': 1},
        {'ans': 'O(n^2)', 'score': 0},
      ]
    },
    {
      'question':
          'What will be the result of the run on the array A = [34, 8, 64, 51, 32, 21],' + '\r\n'
              ' after two iterations?',
      'answers': [
        {'ans': 'A=[8, 21, 32, 34, 51, 64]', 'score': 0},
        {'ans': 'A=[8, 32, 34, 51, 64, 21]', 'score': 0},
        {'ans': 'A=[8, 34, 51, 64, 32, 21]', 'score': 0},
        {'ans': 'A=[8, 34, 64, 51, 32, 21]', 'score': 1},
      ]
    },
    {
      'question': 'How many transition the algorithm will make on the array' + '\r\n'
          ' A = [14, 12, 16, 6, 3, 10] ?',
      'answers': [
        {'ans': '7', 'score': 0},
        {'ans': '6', 'score': 0},
        {'ans': '5', 'score': 1},
        {'ans': '1', 'score': 0},
      ]
    },
    {
      'question':
          'What is guaranteed at the end of the x iterations on the array?',
      'answers': [
        {'ans': 'The first x elements in the array are sorted', 'score': 0},
        {'ans': 'The last x elements in the array are sorted', 'score': 1},
        {'ans': 'The array is sorted', 'score': 0},
        {'ans': 'Nothing is guaranteed', 'score': 0},
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
              ? Quiz(handler: _answer, questions: _questions, index: _qIndex, score: _curscore,)
              : Result(
                  _totalScore, _resetQuiz, _questions.length, "insertion")),
    );
  }
}
