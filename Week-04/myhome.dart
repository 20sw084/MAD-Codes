import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Flutter Home Page"),
     ),
     body: Column(
       children: [
         Text("Some Text"),
         ElevatedButton(onPressed: null, child: Row(
           children: [
             Text("Button"),
             Icon(Icons.abc_outlined),
           ],
         ),),
       ],
     ),
   );
  }
}