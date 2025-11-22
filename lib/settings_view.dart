import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_viewmodel.dart';


class SettingsView extends StatelessWidget {

  const SettingsView(final void setBackgroundColor)

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CalculatorViewModel>(context);


    return Scaffold(
      appBar: AppBar(title: Text("Настройки")),
      body: Column(
        children: [
          ListTile(
            title: Text("Белый фон"),
            trailing: CircleAvatar(backgroundColor: Colors.white),
            onTap: () => setBackgroundColor(),

          ),
          ListTile(
            title: Text("Серый фон"),
            trailing: CircleAvatar(backgroundColor: Colors.grey[300]),
            onTap: () => vm.setBackgroundColor(Colors.grey[300]!),
          ),
          ListTile(
            title: Text("Тёмный фон"),
            trailing: CircleAvatar(backgroundColor: Colors.black87),
            onTap: () => vm.setBackgroundColor(Colors.black87),
          ),
        ],
      ),
    );
  }


}
