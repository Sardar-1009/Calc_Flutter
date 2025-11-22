import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'viewmodels/calculator_viewmodel.dart';
import 'views/simple_calculator_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Калькулятор (MVVM)",
      debugShowCheckedModeBanner: false,
      home: SimpleCalculatorView(),
    );
  }
}
