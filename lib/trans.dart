import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Trans extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;

  Trans(this.title, this.amount, this.date);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$${amount}',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple
              ),

            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Text(DateFormat.yMMMd().format(date),style: TextStyle(color: Colors.grey),),
          ],
        )
      ],
    );
  }
}
