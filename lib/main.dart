import 'package:app/widgets/inputArea.dart';
import 'package:app/widgets/list_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() {
// SystemChrome.setPreferredOrientations([
// DeviceOrientation.portraitUp,
// DeviceOrientation.portraitDown,
//
// ]);
//

  runApp(App());}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 60.5, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
    Transaction(id: "t2", title: "eating", amount: 70, date: DateTime.now()),
  ];

  void _addNewTransaction(String tit, double am, DateTime dt) {
    setState(() {
      //print("done")
      transactions.add(Transaction(
          id: DateTime.now().toString(), title: tit, amount: am, date: dt));
    });
  }

  void _delTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }
  void _chartShow(bool val,bool show){
    setState(() {
      show=val;

    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: FabExample(_addNewTransaction, transactions, _delTransaction,_chartShow),
    );
  }
}

class FabExample extends StatelessWidget {
  final Function addtx;
  final List<Transaction> transactions;
  final Function deltx;
  final Function showCh;

  FabExample(this.addtx, this.transactions, this.deltx,this.showCh);

  void _startAddNewTrans(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Input(addtx);
        });
  }

  bool _showChart=false;
  List<Transaction> get recentTransaction {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: Text('Personal Expenses'),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
// by default mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            // MediaQuery.of(context).orientation==Orientation.landscape ?
            //      Row( mainAxisAlignment: MainAxisAlignment.center, children: [
            //
            //        Text("Show Chart"),
            //        Switch(value: _showChart, onChanged: (val){
            //          showCh(val,_showChart);
            //          print(_showChart);
            //
            //
            //        }),
            //      ],)
            // :
              // _showChart ?
               Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(recentTransaction),
              ),
              //:
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.7,
                  child: Trans(transactions, deltx)),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTrans(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
