
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  
  final List<Transaction> _usertransactions;
  final Function deltx;
  TransactionList(this._usertransactions,this.deltx);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 450,
      child: _usertransactions.isEmpty ?
      Column(children: [
        Text("Oops!! Nothing to show"),
        SizedBox(height:20),
        Container(
          
          margin:EdgeInsets.only(top: 50),
          child: Image.asset("assets/images/c3.png",))
      ],)
      
      :ListView.builder(
        itemBuilder:(ctx,index){
     return Card(
       elevation: 5,
       margin: EdgeInsets.symmetric(horizontal:5,vertical:8),
            child: ListTile(
         leading:CircleAvatar(radius: 30,child: Padding(padding:EdgeInsets.all(6),child: FittedBox(child: Text("\$${_usertransactions[index].amount}"))),
         ),
        title:Text(_usertransactions[index].title,style: TextStyle(fontSize: 16),),
        subtitle: Text(DateFormat.yMMMd().format(_usertransactions[index].date),
       ),
       trailing: IconButton(icon: Icon(Icons.delete), onPressed: ()=>deltx(_usertransactions[index].id),color: Colors.red,),
       ),
     );
     

        },
        itemCount:_usertransactions.length
          

          

        ),
    )
   ;
  }
}