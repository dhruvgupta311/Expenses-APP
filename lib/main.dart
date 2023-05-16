import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './widgets/transaction_list.dart';

import './widgets/chart.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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
 List<Transaction> get _recentTransactions{
  return _userTransactions.where((tx) {
    return tx.date.isAfter(
      DateTime.now().subtract(
        Duration(days: 7),
      ),
      // jo jo transaction 7 day ke andar honge wo wo ki list return hogi
      // where will return true if tx transaction is having the date after the 7 days (back wale);
    );
  }).toList();
}

  void _addNewTransactions(String txTitle,double txAmount,DateTime _selectedDate){
    final newTx=Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: _selectedDate);
  setState((){
    _userTransactions.add(newTx);
  });
  }
  void _deleteTransactions(String id){
    setState(() {
      _userTransactions.removeWhere((tx) =>tx.id==id);
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
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Expenses App',),
          actions: [
            IconButton(
              onPressed: ()=>_startAddnewtransaction(context), 
              icon: Icon(Icons.add),
              color:Color.fromARGB(255, 38, 25, 74),
              ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1564951434112-64d74cc2a2d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60'
                    ),
                fit: BoxFit.cover,
              ),
            ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransactions),
            TransactionList(_userTransactions,_deleteTransactions),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:  ()=>_startAddnewtransaction(context),
          child: Icon(Icons.add),
        ),
        
      ),
    );
  }
}
