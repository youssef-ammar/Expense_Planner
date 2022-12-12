import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  // const Input({Key? key}) : super(key: key);
  final Function addTx;

  Input(this.addTx);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final entredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if ((entredTitle.isEmpty) || (enteredAmount <= 0)) {
      return;
    }
    widget.addTx(entredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
                height: 70,
                child: Row(
                  children: [
                    Text("No Date chosen!"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Choose date",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                )),
            ElevatedButton(
              onPressed: submitData,
              //style: TextButton.styleFrom(co),
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
