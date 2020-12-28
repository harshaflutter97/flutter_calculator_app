import 'dart:async';

import 'package:flutter/material.dart';
import 'package:calculatorapp/calculator_ui.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return   MaterialApp(home: SplashScreen());
  }

}

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
//    animation = ColorTween(begin: Colors.blueAccent, end: Colors.redAccent)
//        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    Timer(Duration(seconds: 5),()=> {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return CalcApp();
      }))
    })  ;

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black87,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('assets/calculator.png'),
                      height: 57.0,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 8.0)),
                  TypewriterAnimatedTextKit(

                    text: ['Calculator App'],
                    textStyle: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}