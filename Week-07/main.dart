import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  // Future<String> getData() async{
  //   await Future.delayed(Duration(seconds: 5,),);
  //   return "Greetings";
  // }

  Stream<String> getData() async* {
    while(true){
      await Future.delayed(Duration(seconds: 1,),);
      DateTime dt = DateTime.now();
      yield "${dt.hour}:${dt.minute}:${dt.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        // child: FutureBuilder(
        //   future: getData(),
        //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //     if(snapshot.connectionState == ConnectionState.waiting){
        //       return CircularProgressIndicator();
        //     }
        //     else if(snapshot.hasError){
        //       return Text("Error is : ${snapshot.error}");
        //     }
        //     else{
        //       return Text("${snapshot.data}");
        //     }
        //   },
        // ),
        child: StreamBuilder(
          stream: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                else if(snapshot.hasError){
                  return Text("Error is : ${snapshot.error}");
                }
                else{
                  return Text("${snapshot.data}");
                }
          },
        ),
      ),
    );
  }
}