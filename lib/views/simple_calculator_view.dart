import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_viewmodel.dart';
import '../settings_view.dart';

class SimpleCalculatorView extends StatelessWidget {
  Widget buildButton(BuildContext context, String text, {Color? color}) {
    final vm = Provider.of<CalculatorViewModel>(context, listen: false);

    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey[200],
          padding: EdgeInsets.all(24),
        ),
        onPressed: () => vm.buttonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (_, vm, __) => Scaffold(
        backgroundColor: vm.backgroundColor,


        appBar: AppBar(
          title: Text("Калькулятор"),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SettingsView()),
                );
              },
            ),
          ],
        ),


        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(
                  vm.input,
                  style: TextStyle(fontSize: 32, color: Colors.black54),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                vm.result,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    buildButton(context, '7'),
                    buildButton(context, '8'),
                    buildButton(context, '9'),
                    buildButton(context, '÷', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(context, '4'),
                    buildButton(context, '5'),
                    buildButton(context, '6'),
                    buildButton(context, '×', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(context, '1'),
                    buildButton(context, '2'),
                    buildButton(context, '3'),
                    buildButton(context, '-', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(context, 'C', color: Colors.red[200]),
                    buildButton(context, '0'),
                    buildButton(context, '=', color: Colors.green[300]),
                    buildButton(context, '+', color: Colors.orange),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
