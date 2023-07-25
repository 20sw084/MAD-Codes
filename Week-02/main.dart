import 'package:flutter/material.dart';

 
// State:
// Behaviour of Action
// Values of Variables at any point is State:

 

void main() {
  runApp(const MyApp());
}

 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(title: 'Hello Futter Developers!'));
  }
}

 

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, this.title = "Good Afternoon"});
  String title;

 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

 

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int times = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              print("Chat Button Pressed: $counter times");
              setState(() {
                widget.title = "New Title $counter";
                counter++;
              });
            },
            child: const Icon(Icons.chat),
          ),
          FloatingActionButton(
            onPressed: () { setState(() {
              times++;
            });
            widget.title = "Variable $times";},
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () { setState(() {
              times--;
            });
            widget.title = "Variable $times";},
            child: Icon(Icons.subtitles_rounded),
          ),
        ],
      ),
     body: Column(
      children: [
                Text(
                  "Hello Flutter Developers",
                  style: TextStyle(
                      color: Colors.purple, fontStyle: FontStyle.italic),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Click me?"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("Click me?"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Click me?"),
                ),
      ],
     ),
    );
  }
}
