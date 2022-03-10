import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main(){
  runApp(quizBubbleSort());
}

class quizBubbleSort extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizState();
    //throw UnimplementedError();
  }
}

class _QuizState extends State<quizBubbleSort> {
  final _questions = [
    {
      'question': 'What is the worst case time complexity of bubble sort?',
      'answers': [
        {'ans': 'O(log(n))', 'score': 0},
        {'ans': 'O(nlog(n))', 'score': 0},
        {'ans': 'O(n)', 'score': 0},
        {'ans': 'O(n^2)', 'score': 1},
      ]
    },
    {
      'question': 'What is the best case time complexity of bubble sort?',
      'answers': [
      {'ans': 'O(log(n))', 'score': 0},
      {'ans': 'O(nlog(n))', 'score': 0},
      {'ans': 'O(n)', 'score': 1},
      {'ans': 'O(n^2)', 'score': 0},
      ]
    },
    {
      'question': 'What will be the result of the run on the array A = [12, 4, 8, 2, 15, 13, 1]'
          ' after one iteration?',
      'answers': [
        {'ans': 'A=[4, 8, 2, 12, 15, 13, 1]', 'score': 0},
        {'ans': 'A=[4, 8, 2, 12, 13, 1, 15]', 'score': 1},
        {'ans': 'A=[1, 2, 4, 8, 12, 13, 15]', 'score': 0},
        {'ans': 'A=[2, 12, 4, 8, 1, 15, 13]', 'score': 0},
      ]
    },
    {
      'question': 'What is the maximum number of comparisons needed if'
          ' there are 5 elements in the array?',
      'answers': [
        {'ans': '10', 'score': 1},
        {'ans': '2', 'score': 0},
        {'ans': '5', 'score': 0},
        {'ans': '25', 'score': 0},
      ]
    },
    {
      'question': 'What is guaranteed at the end of the first iteration on the array?',
      'answers': [
        {'ans': 'The first element in the array is the lowest', 'score': 0},
        {'ans': 'The last element in the array is the highest', 'score': 1},
        {'ans': 'The array is sorted', 'score': 0},
        {'ans': 'Nothing is guaranteed', 'score': 0},
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