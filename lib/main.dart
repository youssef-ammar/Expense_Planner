import 'package:app/widgets/inputArea.dart';
import 'package:app/widgets/list_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 60.5, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
  ];
  void _addNewTransaction(String tit, double am) {
    setState(() {
      //print("done")
      transactions.add(Transaction(
          id: DateTime.now().toString(),
          title: tit,
          amount: am,
          date: DateTime.now()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          home:   FabExample(_addNewTransaction,transactions),
        );
  }

}
class FabExample extends StatelessWidget {
final Function addtx;
final List<Transaction> transactions;

 FabExample(this.addtx,this.transactions);

  void _startAddNewTrans(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return  Input(addtx);
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTrans(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
// by default mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(),
              Trans(transactions),
            ]),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTrans(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
