import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(TestTask());
}

class TestTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey there',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor, _splashColor;

  @override
  void initState() {
    _setRandomColor();
    super.initState();
  }

  void _setRandomColor() {
    setState(() {
      _backgroundColor = _splashColor ?? _generateRandomColor();
      _splashColor = _generateRandomColor();
    });
  }

  Color _generateRandomColor() {
    return Color(Random().nextInt(0xffffffff));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: _backgroundColor,
      ),
    );

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: InkWell(
        splashColor: _splashColor,
        onTap: () => _setRandomColor(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hey there',
                style: TextStyle(
                    fontSize: 20,
                    color: _backgroundColor.computeLuminance() < 0.5
                        ? Colors.white
                        : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
