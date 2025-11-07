import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Простой калькулятор',
      debugShowCheckedModeBanner: false,
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String input = '';  
  String result = ''; 

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '';
      } else if (value == '=') {
        _calculateResult();
      } else {
        input += value;
      }
    });
  }

  void _calculateResult() {
    try {
      String finalInput = input.replaceAll('×', '*').replaceAll('÷', '/');
      double res = double.parse(finalInput.split(RegExp(r'[-+*/]')).first);

      String num = '';
      String op = '';
      for (int i = 0; i < finalInput.length; i++) {
        String ch = finalInput[i];
        if ('0123456789.'.contains(ch)) {
          num += ch;
        } else if ('+-*/'.contains(ch)) {
          if (op.isEmpty) {
            res = double.parse(num);
          } else {
            res = _applyOperator(res, double.parse(num), op);
          }
          op = ch;
          num = '';
        }
      }
      if (num.isNotEmpty && op.isNotEmpty) {
        res = _applyOperator(res, double.parse(num), op);
      }

      result = res.toString();
    } catch (e) {
      result = 'Ошибка';
    }
  }

  double _applyOperator(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return b == 0 ? double.nan : a / b;
      default:
        return 0;
    }
  }

  Widget buildButton(String text, {Color? color}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey[200],
          padding: EdgeInsets.all(24),
        ),
        onPressed: () => buttonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Калькулятор')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                input,
                style: TextStyle(fontSize: 32, color: Colors.black54),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              result,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('÷', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('×', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('C', color: Colors.red[200]),
                  buildButton('0'),
                  buildButton('=', color: Colors.green[300]),
                  buildButton('+', color: Colors.orange),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
