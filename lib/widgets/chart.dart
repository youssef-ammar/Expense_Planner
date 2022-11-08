import 'package:flutter/material.dart';
class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
   return Card(
      color: Colors.blue,
      elevation: 5,
      child: Container(
        child: Text('CHART'),
        width: double.infinity,
      ),

    );
}}
