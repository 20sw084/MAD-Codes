import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_09/todo.dart';
import 'package:week_09/todonotifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return TodoNotifier();
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // State Management with Provider.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TODO Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final _textFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO app"),
      ),
      body: ListView.builder(
          itemCount: context.watch<TodoNotifier>().getTodos.length,
          itemBuilder: (context, index) {
            Todo todo = context.watch<TodoNotifier>().getTodos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (value) {
                  context.read<TodoNotifier>().toggleIsDone(index);
                },
              ),
              title: Text(todo.title),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<TodoNotifier>().removeTodo(index);
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('TextField in Dialog'),
                content: TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: "Text Field in Dialog"),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: () {
                      print(_textFieldController.text);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
          context
              .read<TodoNotifier>()
              .addTodo(Todo(isDone: false, title: _textFieldController.text));
          // Add through AlertBox
        },
      ),
    );
  }
}
