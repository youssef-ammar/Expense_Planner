import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class Trans extends StatelessWidget {
   final List<Transaction> transactions;
  final Function delete;

   const Trans(this.transactions, this.delete);

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
                  padding: const EdgeInsets.all(20),
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
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding:const EdgeInsets.all(10),
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () {
                              delete(transactions[index].id);
                            },
                           style: TextButton.styleFrom(
                           foregroundColor: Theme.of(context).errorColor, // Text Color
                      ),
                            icon: const Icon(Icons.delete),
                            label: const Text('Delete'),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              delete(transactions[index].id);
                            },
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
