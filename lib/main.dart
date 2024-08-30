import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String history = "";
  String displayText = "";
  String result = "";
  String operation = "";
  double firstNum = 0;
  double secondNum = 0;

  void onButtonClick(String btnValue) {
    if (btnValue == "C") {
      history = "";
      displayText = "";
      result = "";
      operation = "";
      firstNum = 0;
      secondNum = 0;
    } else if (btnValue == "+" || btnValue == "-" || btnValue == "X" || btnValue == "/") {
      firstNum = double.parse(displayText);
      result = "";
      operation = btnValue;
    } else if (btnValue == "=") {
      secondNum = double.parse(displayText);

      if (operation == "+") {
        result = (firstNum + secondNum).toString();
      } else if (operation == "-") {
        result = (firstNum - secondNum).toString();
      } else if (operation == "X") {
        result = (firstNum * secondNum).toString();
      } else if (operation == "/") {
        result = (firstNum / secondNum).toString();
      }

      history = firstNum.toString() + operation + secondNum.toString();
    } else {
      result = displayText + btnValue;
    }

    setState(() {
      displayText = result;
    });
  }

  Widget customButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => onButtonClick(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                history,
                style: TextStyle(fontSize: 24, color: Colors.black26),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                customButton("C"),
                customButton("1"),
                customButton("2"),
                customButton("+"),
              ],
            ),
            Row(
              children: [
                customButton("3"),
                customButton("4"),
                customButton("5"),
                customButton("-"),
              ],
            ),
            Row(
              children: [
                customButton("6"),
                customButton("7"),
                customButton("8"),
                customButton("X"),
              ],
            ),
            Row(
              children: [
                customButton("9"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

