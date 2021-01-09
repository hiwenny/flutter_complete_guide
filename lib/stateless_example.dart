import 'package:flutter/material.dart';

// =================
// Stateless Example
// =================
class Example {
  String name;
  int age;

// If it's not named, it is required. It also can't have a default value.
  Example(String inputName,
      {String optionalVar1 = 'default',
      int optionalVar2 = 0,
      int age=30,
      @required String namedValue3}) {
    name = inputName;
    age = this.age;
    print(optionalVar1);
    print(optionalVar2);
  }
  // Alternatively do Example({this.name, this.age}) as shorthand for constructed properties.

  // Sample class with utilty constructor
  Example.veryOld(this.name) {
    age = 600;
  }
}

// StatelessWidget is from Flutter
// MaterialApp is a Widget from Material
// Text is a Widget from Material
class StaticBaseApp extends StatelessWidget {
  // decorator from Dart. Explicitly states that we are overriding StatelessWidget's build method with our implementation.
  // Good practice is to explicitly say @override, even though it works fine without.
  // This clarifies that we didn't rewrite over existing method by accident.
  @override
  // build is a StatelessWidget method
  Widget build(BuildContext ctx) {
    Example('Test', age: 30, namedValue3: 'String 3');
  // Sample class with utilty constructor for predefined settings.
    Example('Test very old', namedValue3: 'Required');

    var questionIndex = 0;
    // This is a method custom to BaseApp
    void answerQuestion() {
      questionIndex += 1;
      print('This is an answer!');
    }

    // Instead of String[]
    List<String> questions = [
      'Question from list 1',
      'Question from list 2',
    ];

    // Scaffold is another MaterialUI Widget to create page quickly.
    // AppBar is also from MatUI
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        // body: Column(children: <Widget>[]
        // [] is how you tell it's a list.
        // <Widget> can be omitted - Dart supports type inference
        body: Column(children: [
          Text('Dynamic answer'),
          RaisedButton(
            child: Text(questions[
                questionIndex]), // This WON'T WORK. StatelessWidget is immutable.
            onPressed: answerQuestion,
          ),
          Text('Static answers'),
          RaisedButton(
            child: Text(questions[0]),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text(questions.elementAt(
                1)), // It can also be accessed using List method elementAt.
            onPressed: null,
          ),
          RaisedButton(
            child: (Text('Expressed callback')),
            onPressed: () => print('Method is a func expression'),
          ),
          RaisedButton(
            child: Text('Disabled answer'),
            onPressed: null, // sample disabled button.
          ),
        ]),
      ),
    );
  }
}
