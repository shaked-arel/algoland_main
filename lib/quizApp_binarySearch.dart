import 'package:flutter/material.dart';
import './question.dart';
import './quiz.dart';
import './answer.dart';
import './result.dart';

//void main(){
//  runApp(MyApp());
//}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizState();
    //throw UnimplementedError();
  }
}

class _QuizState extends State<QuizApp> {
  final _questions = [
    {
      'question': 'what is your favorite color?',
      'answers': [
        {'ans': 'white', 'score': 10},
        {'ans': 'red', 'score': 8},
        {'ans': 'blue', 'score': 4},
        {'ans': 'green', 'score': 1},
      ]
    },
    {
      'question': 'what is your favorite animal?',
      'answers': [
        {'ans': 'lion', 'score': 3},
        {'ans': 'dog', 'score': 11},
        {'ans': 'fish', 'score': 5},
        {'ans': 'rabbit', 'score': 9},
      ]
    },
    {
      'question': 'who is your favorite disney character?',
      'answers': [
        {'ans': 'tinkerbel', 'score': 10},
        {'ans': 'mulan', 'score': 8},
        {'ans': 'mushu', 'score': 4},
        {'ans': 'olaf', 'score': 1},
      ]
    },
  ];
  var _qIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  void _answer(int score) {
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
            title: Text("Let's see how much you learned"),
          ),
          body: _qIndex < _questions.length
              ? Quiz(handler: _answer, questions: _questions, index: _qIndex)
              : Result(
                  _totalScore,
                  _resetQuiz,
                  _questions.length,
                )),
    );
  }
}
