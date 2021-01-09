import 'package:flutter/material.dart';

void main() {
  runApp(BaseApp());
}

// Alternatively:
// void main() => runApp(BaseApp());

class Example {
  String name;
  int age;

  Example(String inputName, int age,
      {String optionalVar1 = 'default',
      int optionalVar2 = 0,
      @required String namedValue3}) {
    name = inputName;
    age = this.age;
    print(optionalVar1);
    print(optionalVar2);
  }
  // Alternatively do Example({this.name, this.age}) as shorthand for constructed properties.

}
// StatelessWidget is from Flutter

// MaterialApp is a Widget from Material
// Text is a Widget from Material
class BaseApp extends StatelessWidget {
  // decorator from Dart. Explicitly states that we are overriding StatelessWidget's build method with our implementation.
  // Good practice is to explicitly say @override, even though it works fine without.
  // This clarifies that we didn't rewrite over existing method by accident.
  @override
  Widget build(BuildContext ctx) {
    Example('Test', 30, namedValue3: 'String 3');

    // return MaterialApp(home: Text('Hellow'));

    // Scaffold is another MaterialUI Widget to create page quickly.
    // AppBar is also from MatUI
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Text('Default body text'),
      ),
    );
  }
}
