
import 'package:exp/widgets/new_transaction.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import "./widgets/charts.dart";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      accentColor:Colors.amber,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final List<Transaction> _usertransactions=[
   // Transaction(id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    //Transaction(id: "t2", title: "New tshirt", amount: 69, date: DateTime.now()),
 ];
 List<Transaction> get _recentTransaction{
   return _usertransactions.where((tx) {
   return tx.date.isAfter(DateTime.now().subtract(Duration(days:7)));
   }).toList();
 }
 void _addNewTransaction(String txtitle,double txamnt,DateTime chosenDate)
 {
   final nwtx=Transaction(title: txtitle,amount: txamnt,date:chosenDate,id: DateTime.now().toString(), );
   setState((){
  _usertransactions.add(nwtx);
});
 }
void _startAddNewTransaction(BuildContext ctx)
{
showModalBottomSheet(context:ctx, builder: (_)
{
return GestureDetector(onTap:(){},child: NewTransaction(_addNewTransaction),
behavior: HitTestBehavior.opaque,);
});

}
void _deleteTransaction(String id){
  setState(() {
    _usertransactions.removeWhere((tx) => tx.id==id);
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Expenses"),
        actions: [IconButton(icon: Icon(Icons.add), onPressed:()=>_startAddNewTransaction(context),
        )],

      ),
      body: SingleChildScrollView(
              child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         Chart(_recentTransaction),
        TransactionList(_usertransactions,_deleteTransaction),
        ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed:()=>_startAddNewTransaction(context),),
    );
      
   
  }
}
