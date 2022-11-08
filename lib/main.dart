import './transaction.dart';
import 'package:flutter/material.dart';
import './trans.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 60.5, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
  ];

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
                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Container(
                      child: Text('CHART'),
                      width: double.infinity,
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(labelText: 'Title'),
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Amount'),
                          ),
                          TextButton(onPressed: (){}, child: Text('Add Transaction', style:TextStyle(color:Colors.purple),),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Column(
                      children: transactions.map((tx) {
                    return Card(child: Trans(tx.title, tx.amount, tx.date));
                  }).toList()),
                ])));
  }
}
