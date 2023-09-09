import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'User.dart';

void main() {
  runApp(const MyApp());
}

// any service available over web is web server.
// method to access web service is via apis.
// URI: Uniform resource identifier
// parse string to URI. (http.get(Uri,parse("some URL")))

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST apis Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter REST apis Demo Home Page'),
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
  dynamic _users = [];
  bool loading = false;

  Future<String> _getUsers() async {
    setState(() => loading = true);
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    setState(() {
      _users = json.decode(response.body.toString());
      loading = false;
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API's"),
      ),
      body: Column(
        children: [
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(_users[index]["id"].toString()),
                        title: Text(_users[index]["name"]),
                        subtitle: Text(_users[index]["email"]),
                        trailing: Text(_users[index]["website"]),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
