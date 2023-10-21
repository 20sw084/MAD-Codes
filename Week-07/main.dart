import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future<String> getDataViaFuture() async{
    await Future.delayed(const Duration(seconds: 5,),);
    return "Greetings";
  }

  Stream<String> getDataViaStream() async* {
    while(true){
      await Future.delayed(const Duration(seconds: 1,),);
      DateTime dt = DateTime.now();
      yield "${dt.hour}:${dt.minute}:${dt.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asynchronous Programming'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder(
              future: getDataViaFuture(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            StreamBuilder(
              stream: getDataViaStream(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error is : ${snapshot.error}");
                } else {
                  return Text("${snapshot.data}");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
