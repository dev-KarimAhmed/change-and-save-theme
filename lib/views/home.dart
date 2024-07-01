import 'package:change_theme/views/colors_view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change theme'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ColorsChoose()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Center(
          child: Text(
        "Home",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
