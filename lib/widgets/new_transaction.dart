import 'package:flutter/material.dart';

class NewTransation extends StatefulWidget {
  final Function addTx;

  NewTransation(this.addTx);

  @override
  State<NewTransation> createState() => _NewTransationState();
}

class _NewTransationState extends State<NewTransation> {
   final titleController=TextEditingController();

  final amountController=TextEditingController(); 

  void submitdata(){
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
   widget.addTx(titleController.text,double.parse(amountController.text),);
   Navigator.of(context).pop();
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