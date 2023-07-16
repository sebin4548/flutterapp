import 'package:flutter/material.dart';

void main() {
  runApp(App());
  var nico = Player("Potato");
}

class Player {
  String name;

  Player(this.name);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello Flutter")),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
