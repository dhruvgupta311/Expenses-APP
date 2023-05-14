import 'dart:ffi';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget{
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String,Object>> get grptv{
    return List.generate(7, (index){
      final weekday=DateTime.now().subtract(Duration(days: index),);
      double totalsum=0.0;
      for(int i=0;i<recentTransactions.length;i++){
        if(recentTransactions[i].date.day==weekday.day && recentTransactions[i].date.month==weekday.month && recentTransactions[i].date.year==weekday.year){
          totalsum+=recentTransactions[i].amount;
        }
      }
      //wwekday phle sunday hoga phir monday hoga to total sum phle sunday ke sare transaction ke amount ka sum de dega
      // like wise sbhi pichle days ka sum mil jaaaega
      print(DateFormat.E().format(weekday));
      print(totalsum);
      return{
        'day':DateFormat.E().format(weekday).substring(0,1),
        'amount':totalsum,
      };
    });
  }

  @override
  Widget build(BuildContext context){
    print(grptv);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child:Row(
        children: grptv.map((data){
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      )
    );
  }
}