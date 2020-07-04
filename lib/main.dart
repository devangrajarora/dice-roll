import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[900],
        appBar: AppBar(
          bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(2.0),
          ),
          centerTitle: true,
          title: Text(
            'Roll the Dice!',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: DicePage(), // stateful widget
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() =>
      _DicePageState(); // create an instance of DicePageState
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          setState(() {
            left = Random().nextInt(6) + 1;
            right = Random().nextInt(6) + 1;
          });
        },
        child: Center(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/dice$left.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/dice$right.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
