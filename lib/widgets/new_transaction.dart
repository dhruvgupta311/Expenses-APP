import 'package:flutter/material.dart';

class NewTransation extends StatelessWidget {
   final titleController=TextEditingController();
  final amountController=TextEditingController(); 
  final Function addTx;

  NewTransation(this.addTx);
  void submitdata(){
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
   addTx(titleController.text,double.parse(amountController.text),);
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 5,
            child:Container(
              padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller:titleController,
                onSubmitted:(_)=>submitdata,
                // onChanged: (val){
                //   titleInput=val;
                // },
                ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                 onSubmitted:(_)=>submitdata,
                // onChanged: (val){
                //   amountInput=val;
                // },
                ),
              OutlinedButton(
                onPressed: (){
                  submitdata();
                }, 
              child: Text('Add Transaction',
              style: TextStyle(
               color: Colors.purple,),
              ),
              ),
            ],
            ),
          ),
         );
  }
}