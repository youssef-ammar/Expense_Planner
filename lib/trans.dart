import 'package:flutter/material.dart';

class Trans extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  Trans( this.title,this.amount,this.date);
  @override

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
            padding: EdgeInsets.all(10),
            child: Text( amount.toString())),
        Column(
          children: <Widget>[
            Text(title),
            Text(date.toString()),

          ],
        )
      ],
    );
  }
}
