import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:calculatorapp/calculator_widget.dart';
void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF545F61),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: 'AC',
                    textSize: 25,
                    callback: allClear,
                  ),
                  CalButton(
                    text: 'C',
                    callback: clear,
                  ),
                  CalButton(
                    text: '%',
                   // fillColor: Colors.redAccent,
                    callback: numClick,
                  ),
                  CalButton(
                    text: '/',
                    fillColor: Colors.redAccent,
                    //textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '7',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '8',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '9',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '*',
                    fillColor: Colors.redAccent,
                   // textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: numClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '4',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '5',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '6',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '-',
                    fillColor: Colors.redAccent,
                    //textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '1',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '2',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '3',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '+',
                    fillColor: Colors.redAccent,
                   // textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalButton(
                    text: '.',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '0',
                    callback: numClick,
                  ),
                  CalButton(
                    text: '00',
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalButton(
                    text: '=',
                    fillColor: Colors.blueAccent,
                    //textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}