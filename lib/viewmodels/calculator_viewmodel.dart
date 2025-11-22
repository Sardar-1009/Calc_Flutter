import 'package:flutter/material.dart';
import '../models/ calculator_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  CalculatorModel model = CalculatorModel();

  // 🔥 Цвет фона
  Color backgroundColor = Colors.white;

  String get input => model.input;
  String get result => model.result;





  void buttonPressed(String value) {
    if (value == 'C') {
      model.input = '';
      model.result = '';
    } else if (value == '=') {
      _calculate();
    } else {
      model.input += value;
    }
    notifyListeners();
  }

  void setBackgroundColor(Color color, context) {
    onTap: () => Navigator.pop(context);
    backgroundColor = color;
    notifyListeners();
  }


  void _calculate() {
    try {
      String finalInput =
      model.input.replaceAll('×', '*').replaceAll('÷', '/');

      double res = double.parse(
          finalInput.split(RegExp(r'[-+*/]')).first);

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

      model.result = res.toString();
    } catch (e) {
      model.result = 'Ошибка';
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
}
