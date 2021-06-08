import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(MyApp());
}

const _duration = Duration(milliseconds: 400);

double randomBorderRadius() {
  return Random().nextDouble() * 12;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color;
  double borderRadius1;
  double margin;
  @override
  void initState() {
    super.initState();
    color = Colors.black;
    borderRadius1 = randomBorderRadius();
  }

  void _incrementCounter() {
    setState(() {
      color = randomColor();
      borderRadius1 = randomBorderRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    Random random = new Random();
    double randomNumber1 = random.nextDouble() * width;
    double randomNumber2 = random.nextDouble() * height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
          child: SizedBox(
        child: AnimatedContainer(
          height: randomNumber2,
          width: randomNumber1,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius1),
          ),
          duration: _duration,
        ),
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
