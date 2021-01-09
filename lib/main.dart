import 'package:flutter/material.dart';
import './question.dart';

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
  void answerQuestion() {
    // IMPORTANT
    // Without this, the internal state will still change, but doesn't re-render.
    // a.k.a doesn't run build() again.
    // Use this for changes that require rebuilds.
    setState(() {
      _questionIndex += 1;
    });
    print('This is an answer! $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    // Instead of String[]
    List<String> questions = [
      'Question from list 1',
      'Question from list 2',
      'Question from list 3',
      'Question from list 4',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful one'),
        ),
        body: Column(children: [
          Question('What\s your state?'),
          RaisedButton(
            child: Text(questions[
                _questionIndex]), // This WON'T WORK. StatelessWidget is immutable.
            onPressed: answerQuestion,
          ),
        ]),
      ),
    );
  }
}