import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meal_challenge/screens/main_screen.dart';

void main() => runApp(MaterialApp(
      home: FirstScreen(),
    ));

//Wrap the Material app in a widget in order to get context before app start to get the screen size
class FirstScreen extends StatelessWidget {
  static double _screenWidth;
  static double get screenWidth => _screenWidth;
  @override
  Widget build(BuildContext context) {
    var doublea = MediaQuery.of(context).size.width;
    _screenWidth = doublea.toDouble();
    return MainScreen(_screenWidth);
  }
}
