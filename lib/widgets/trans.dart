import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Trans extends StatefulWidget {
  @override
  State<Trans> createState() => Trans_State();
}

class Trans_State extends State<Trans> {
  List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 60.5, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMd().format(tx.date),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ));
    }).toList());
  }
}
