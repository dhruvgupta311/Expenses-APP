import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx,constraints){
            return Column(
              children: [
                Text(
                  'No Transaction is added yet!!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: constraints.maxHeight*0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                if (index < transactions.length) {
                  return Container(
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      color: Color.fromARGB(255, 202, 226, 239), // Background color inside the card
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurpleAccent,
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text('\$${transactions[index].amount}',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.black,
        ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTx(transactions[index].id),
                          color: Color.fromARGB(255, 112, 4, 115),
                        ),
                      ),
                    ),
                  );
                } else {
                  return null;
                }
              },
            ),
    );
  }
}
