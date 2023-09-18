import 'package:flutter/material.dart';
import 'package:week_10/db_helper.dart';
import 'note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Notes using SQFLite'),
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
  List<Note> notes = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  int selectedId = -1;

  Future<void> _loadnotes() async {
    DbHelper dbHelper = DbHelper();
    final notelist = await dbHelper.queryAll();
    setState(() {
      notes = notelist;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadnotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        DbHelper dbHelper = DbHelper();
                        await dbHelper.delete(note.id!);
                        _loadnotes();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          titleController.text = note.title;
                          contentController.text = note.content;
                          selectedId = note.id!;
                        });
                      },
                    ),
                  ]),
                );
              },
            )),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: "Content",
              ),
            ),
            Row(children: [
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper();
                  Note note = Note(
                    title: titleController.text,
                    content: contentController.text,
                  );
                  await dbHelper.insert(note);
                  _loadnotes();
                  titleController.clear();
                  contentController.clear();
                },
                child: const Text("Insert Task"),
              ),
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper();
                  Note note = Note(
                    id: selectedId,
                    title: titleController.text,
                    content: contentController.text,
                  );
                  await dbHelper.update(note);
                  _loadnotes();
                  titleController.clear();
                  contentController.clear();
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Operation Successful'),
                        content: Text(
                          "Update Done",
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Update Task"),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
