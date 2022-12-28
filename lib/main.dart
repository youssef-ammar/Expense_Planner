import 'dart:io';
import 'package:app/widgets/inputArea.dart';
import 'package:app/widgets/list_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() {
// SystemChrome.setPreferredOrientations([
// DeviceOrientation.portraitUp,
// DeviceOrientation.portraitDown,
//
// ]);
//

  runApp(App());
}

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



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: const TextTheme(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: FabExample(_addNewTransaction, transactions, _delTransaction),
    );
  }
}

class FabExample extends StatefulWidget {
  final Function addTx;
  final List<Transaction> transactions;
  final Function delTx;

  const FabExample(this.addTx, this.transactions, this.delTx);

  @override
  State<FabExample> createState() => FabExampleState();
}

class FabExampleState extends State<FabExample> {
  // final Function showCh;

  void _startAddNewTrans(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Input(widget.addTx);
        });
  }

  bool _showChart = false;

  List<Transaction> get recentTransaction {
    return widget.transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final media = MediaQuery.of(context);
    final appBar = AppBar(
      title: const Text('Personal Expenses'),
    );
    final pageBody = SingleChildScrollView(
        child: Column(
// by default mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (isLandscape )
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Show Chart"),
                    Switch.adaptive(
                        value: _showChart,
                        onChanged: (val) {
                          setState(() {
                            _showChart = val;
                          });
                        }),
                  ],
                ),

              if (!isLandscape)

                Container(
                  height: (media.size.height -
                      appBar.preferredSize.height -
                      media.padding.top) *
                      0.3,
                  child: Chart(recentTransaction),
                )

              ,
              if (!isLandscape)
                Container(
                height: (media.size.height -
                        appBar.preferredSize.height -
                        media.padding.top) *
                    0.7,
                child: Trans(widget.transactions, widget.delTx)),

              if (isLandscape)
                if(_showChart)
                  Container(
                    height: (media.size.height -
                        appBar.preferredSize.height -
                        media.padding.top)
                        ,
                    child: Chart(recentTransaction),
                  ),
              if (!_showChart)
                Container(
                    height: (media.size.height -
                        appBar.preferredSize.height -
                        media.padding.top)
                        ,
                    child: Trans(widget.transactions, widget.delTx)),

            ]
        )
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
           navigationBar: const CupertinoNavigationBar(),
    )
        : Scaffold(
         appBar: appBar,
          body: pageBody,
         floatingActionButtonLocation:
           FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
        // Iphone styling
        onPressed: () => _startAddNewTrans(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
