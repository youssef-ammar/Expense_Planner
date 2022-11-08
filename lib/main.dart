import 'widgets/chart.dart';

import 'package:flutter/material.dart';
import 'widgets/trans.dart';
import 'widgets/inputArea.dart';

void main() => runApp(App());

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter App'),
            ),
            body: Column(
                // by default mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Chart(),
                  Input(),
                  Trans(),

                ])));
  }
}
