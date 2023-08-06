import 'package:flutter/material.dart';
import 'package:week_4/details.dart';

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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Week - 04'),
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // IconButton(icon: Icon(Icons.more_vert), onPressed: () {  },),
            PopupMenuButton(
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: "Settings",
                    child: Text("Settings"),
                  ),
                  PopupMenuItem(
                    value: "Log-out",
                    child: Text("Log-out"),
                  ),
                ];
              },
              onSelected: (value) {
                print(value);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(value),
                      duration: Duration(milliseconds: 500),
                      action: SnackBarAction(
                        label: "Clicked",
                        onPressed: () {
                          print("Button Pressed");
                          // TODO: Some work should be done here to make it functional for WIFI
                          Dialog(
                            child: Text("Do you want to connect WIFI"),
                          );
                        },
                      )),
                );
              },
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Tab # 01"),
              ),
              Tab(
                child: Text("Tab # 02"),
              ),
              Tab(
                child: Text("Tab # 03"),
              ),
              Tab(
                child: Text("Tab # 04"),
              ),
              Tab(
                child: Text("05"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    child: Text("First Widget"),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.green,
                      child: Text("Second Widget"),
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    borderOnForeground: true,
                    child: Text("jfdksfhdgs"),
                  ),
                  FlutterLogo(
                    size: 30,
                  ),
                ],
              ),
            ),
            Center(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.blue,
                  child: Text("GridViewBuild"),
                ),
              ),
            ),
            Center(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.blue,
                  child: Text("GridViewBuild"),
                ),
              ),
            ),
            Center(
              child: ListView.builder(
                itemCount: 18,
                itemBuilder: (context, index) => Container(
                  color: Colors.blue,
                  child: Text("ListViewBuild"),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  child: Text("Navigate now"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Details(data: "Flutterion");
                    }));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
// GridView(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
//   children: [
//     Column(
//       children: [
//         Icon(Icons.ac_unit_outlined),
//         Text("Product 1"),
//       ],
//     ),
//   ],
// ),
