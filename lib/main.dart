import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './widgets/transaction_list.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  String titleInput="";
  String amountInput="";
  final titleController=TextEditingController();
  final amountController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(
                child: Text('CHART!'),
              ),
              elevation: 5,
            ),
          ),
         ///////////////////////////////
       UserTransactions(),
        ],
      ),
    );
  }
}
