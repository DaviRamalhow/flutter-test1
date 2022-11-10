import 'package:flutter/material.dart';
import "./quiz.dart";
import './question.dart';
import './answer.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": 'What\'s your favorite color?',
      "answer": [
        {"text": "Black", "score": 10},
        {"text": "Green", "score": 5},
        {"text": "Blue", "score": 2},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": 'What\'s your favorite animal?',
      "answer": [
        {"text": "Penguim", "score": 10},
        {"text": "Whale", "score": 5},
        {"text": "Dog", "score": 2},
        {"text": "PArrot", "score": 1}
      ]
    },
    {
      "questionText": 'Wich one do you prefer?',
      "answer": [
        {"text": "Iphone", "score": 10},
        {"text": "Samsumg", "score": 5},
        {"text": "Xiaomi", "score": 2},
        {"text": "Nokia", "score": 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = ["Hello"];
    // dummy.add("Max");
    // print(dummy);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
