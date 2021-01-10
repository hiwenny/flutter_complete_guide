import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  // runApp(StaticBaseApp());
  runApp(BaseApp());
}

// Alternatively:
// void main() => runApp(BaseApp());

class BaseApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BaseAppState();
  }
}

// State is its own class. StatefulWidget gets rebuilt - State does not, hence the separation.
// _ is how we privatise classes/properties/etc
class _BaseAppState extends State<BaseApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  // questions is actually storing pointer
  // final _questions = const [
  //   {
  //     'questionText': 'Whatchu doing?',
  //     'answers': ['Mmmm?', 'Bluey', 'Good boy']
  //   },
  //   {
  //     'questionText': 'Pretty birdy?',
  //     'answers': ['Bluey\'s a good boy']
  //   },
  //   {
  //     'questionText': 'Want some seebs?',
  //     'answers': ['Chirp', 'Monch', 'Flies away']
  //   },
  // ];

  final _questionsWithScore = const [
    {
      'questionText': 'Whatchu doing?',
      'answers': [
        {'text': 'Mmmm?', 'score': 3},
        {'text': 'Bluey', 'score': 1},
        {'text': 'Good boy', 'score': 2}
      ]
    },
    {
      'questionText': 'Pretty birdy?',
      'answers': [
        {'text': 'Bluey\'s a good boy', 'score': 3}
      ]
    },
    {
      'questionText': 'Want some seebs?',
      'answers': [
        {'text': 'Chirp', 'score': 2},
        {'text': 'Monch', 'score': 3},
        {'text': 'Flies away', 'score': 1}
      ]
    },
  ];

  void _answerQuestion(int score) {
    // To check if exist: _questionIndex != null
    // Ternary is same as JS. condition ? return 0 : return 1;
    if (_questionIndex < _questionsWithScore.length) {
      // IMPORTANT
      // Without this, the internal state will still change, but doesn't re-render.
      // a.k.a doesn't run build() again.
      // Use this for changes that require rebuilds.
      setState(() {
        _questionIndex += 1;
        _totalScore += score;
      });
      print('This is an answer! $_questionIndex');
    }
  }

  @override
  Widget build(BuildContext context) {
    // It's possible to do var questions = const ['something']
    // What is it for? It prevents mutations, like:
    // var dummy = const ['Hello']
    // dummy.add('Max') // will error because .add() tries to mutate the original array
    // Good practice to prefix const where immutable.

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Stateful one'),
          ),
          body: _questionIndex < _questionsWithScore.length
              ? Quiz(
                  questions: _questionsWithScore,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(_totalScore)),
    );
  }
}
