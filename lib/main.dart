import 'package:flutter/material.dart';
import 'models/transaction.dart';

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

          Card(
            elevation: 5,
            child:Container(
              padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller:titleController,
                // onChanged: (val){
                //   titleInput=val;
                // },
                ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                // onChanged: (val){
                //   amountInput=val;
                // },
                ),
              OutlinedButton(
                onPressed: (){
                  print(titleController.text);
                }, 
              child: Text('Add Transaction',
              style: TextStyle(
               color: Colors.purple,),
              ),
              ),
            ],
            ),
          ),
         ),
   
        
        ],
      ),
    );
  }
}
