import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context){
    return   Container(
      height: 400,
      child: transactions.isEmpty ? Column(
        children: [
          Text('No Transaction is added yet!!',style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(
            height: 50,
          ),
         Container(
          height: 300,
          child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),
          ),
        ],
      ) : ListView.builder(
  itemBuilder: (ctx, index) {
    if (index < transactions.length) {
      return Card(
        elevation: 5,
        margin:EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ) ,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('\$${transactions[index].amount}'),
              ),
            ),
          ),
          title: Text(
            transactions[index].title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transactions[index].date),
          ),
        ),
      );
    }
     else {
      return null;
    }
  },
),

    );

  }
}