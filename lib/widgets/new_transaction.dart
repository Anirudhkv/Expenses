import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addnw;
    NewTransaction(this.addnw);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController=TextEditingController();

  final _amountController=TextEditingController();
  DateTime _selectedDate ;


  void _dataSubmit()
  {
    if (_amountController.text.isEmpty){
      return;

    }
final titleText=_titleController.text;
final amountText=double.parse(
  _amountController.text);
if(titleText.isEmpty ||amountText <=0||_selectedDate==null)
{
  return;
   
}
widget.addnw(titleText,amountText,_selectedDate);
Navigator.of(context).pop();
  }
  void _showDate(){

showDatePicker(context: context, 
initialDate:DateTime.now(),
 firstDate: DateTime(2019),
  lastDate: DateTime.now()).then((pickedDate){
if(pickedDate==null){
  return;
}
setState(() {
  _selectedDate=pickedDate;
});


  });

  }

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          child:Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
            TextField(decoration:InputDecoration(labelText:"Title"),
            controller: _titleController,
            onSubmitted:(_)=>_dataSubmit() ,


            ),
            TextField(decoration:InputDecoration(labelText:"Amount"),
            controller: _amountController,
            keyboardType: TextInputType.number,
             onSubmitted:(_)=>_dataSubmit()

            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(child: Text(_selectedDate==null?"No date chosen":DateFormat.yMMMd().format(_selectedDate))),
                  FlatButton(onPressed: _showDate ,
                   child: Text("Choose a date",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                
                  )
                ],
              ),
            ),

            RaisedButton(
              color: Theme.of(context).primaryColor,
              child:Text("Add Transaction",style:TextStyle(color:Colors.white,)),
            onPressed:_dataSubmit,
            ),

        ],),
          ),
        );
     
  }
}