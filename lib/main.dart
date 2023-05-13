import 'package:expenses_app/widgets/new_transaction.dart';
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

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String titleInput="";

  String amountInput="";
   final List<Transaction> _userTransactions=[
    Transaction(
        id: 't1', title: 'New Shoes', amount: 65.9, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly Groceries', amount: 18, date: DateTime.now()),
  ];
  void _addNewTransactions(String txTitle,double txAmount){
    final newTx=Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
  setState((){
    _userTransactions.add(newTx);
  });
  }

  void _startAddnewtransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return 
      GestureDetector( 
        onTap: (){},
        child:NewTransation(_addNewTransactions),
        behavior: HitTestBehavior.opaque,
      );
    },);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App',),
        actions: [
          IconButton(
            onPressed: ()=>_startAddnewtransaction(context), 
            icon: Icon(Icons.add),
            color:Color.fromARGB(255, 38, 25, 74),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Color.fromARGB(255, 91, 170, 235),
                child: Container(
                  child: Text('CHART!'),
                ),
                elevation: 5,
              ),
            ),
           ///////////////////////////////
        TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  ()=>_startAddnewtransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
