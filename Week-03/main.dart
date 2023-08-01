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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = [
    5,
    5,
    6,
    6,
    42,
    5,
    525,
    5,
    6,
    5,
    5,
    5,
    5,
    5,
    5,
    65,
    65,
    5,
    5,
    65,
    66,
    56,
    5,
    65,
    5
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        drawer: Drawer(child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index)=>Text("${list[index]}")),),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Text("data ${list[index]}");
                  }),
            ),
            Container(
              padding: EdgeInsets.all(45),
              height: 550,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.deepOrangeAccent,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => print("Elevated Button Clicked."),
                      child: Text("Elevated Button"),
                  ),
                  OutlinedButton(
                    onPressed: () => print("Outlined Button Clicked."),
                    child: Text("Outlined Button"),
                  ),
                  TextButton(
                    onPressed: () => print("Text Button Clicked."),
                    child: Text("Text Button"),
                  ),
                  FilledButton(
                    onPressed: () => print("Filled Button Clicked."),
                    child: Text("Filled Button"),
                  ),
                  FilledButton.tonal(
                    onPressed: () => print("Filled Button Tonal Clicked."),
                    child: Text("Filled Button Tonal"),
                  ),
                  Image.network("https://th.bing.com/th/id/R.8e2c571ff125b3531705198a15d3103c?rik=ZS6L%2fgS20ouPXA&pid=ImgRaw&r=0"),
                  Card(

                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// onPressed is runtime constant, so it parent functions must not be const(compile time constant).
