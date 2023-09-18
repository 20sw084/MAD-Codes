import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'note.dart';

class DbHelper {
  static Database? _database;
  final String tablename = "notes";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
      return _database!;
    }
  }

  Future<Database> initDb() async {
    final dbpath = await getDatabasesPath();
    final note_db_path = join(dbpath, "notes.db");

    return await openDatabase(
      note_db_path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $tablename(id INTEGER PRIMARY KEY, title TEXT, content TEXT)",
        );
      },
    );
  }

  insert(Note note) async {
    final db = await database;
    await db.insert(
      tablename,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  update(Note note) async {
    final db = await database;
    await db.update(
      tablename,
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }

  delete(int id) async {
    final db = await database;
    await db.delete(tablename, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Note>> queryAll() async {
    final db = await database;
    List<Map<String, dynamic>> notes = await db.query(tablename);
    return List.generate(notes.length, (index) {
      return Note(
        id: notes[index]["id"],
        title: notes[index]["title"],
        content: notes[index]["content"],
      );
    });
  }
}
