import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter App'),
            ),
            body: Column(children:  <Widget>[
              Card(
                color: Colors.blue,
                elevation: 5,
                child: Container( child: Text('test1'), width: 100,),
              ),
              Card(
                elevation: 5,
                child: Container(child: Text('test2')),
              ),
            ])));
  }
}
