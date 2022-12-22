import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

// Liste des Transactions
class Trans extends StatelessWidget {
  List<Transaction> transactions;
  final Function delete;

  Trans(this.transactions,this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added Yet! ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                     margin: EdgeInsets.symmetric(vertical: 8 ,horizontal:5 ),
                    child:ListTile(
                    leading: CircleAvatar(
                       radius: 30,
                       child: Padding(
                         padding: EdgeInsets.all(10),
                          child: Text('\$${transactions[index].amount}'),

                  ),
                ),
                      title:Text(transactions[index].title,style: Theme.of(context).textTheme.headline6,),
                     subtitle: Text(DateFormat.yMMMd().format( transactions[index].date) ),
                        trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){delete(transactions[index].id);},color: Theme.of(context).errorColor,),
                ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
