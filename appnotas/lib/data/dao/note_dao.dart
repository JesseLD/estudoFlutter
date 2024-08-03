//**
// This data access object class is responsible for handling all the database operations related to the Note model
//
//*/

import 'package:appnotas/database/database.dart';
import 'package:appnotas/models/note_model.dart';

class NoteDao {
  // This method gets all the notes from the database
  Future<List<NoteModel>> getNotes() async {
    // Getting the database
    var db = await Database.initDB();

    List<NoteModel> response = [];
    // Getting the notes
    // 'notes' is the table name
    var notes = await db.query('notes');

    // Checking if is empty
    if (notes.isEmpty) {
      return [];
    }

    // print("Notes ${notes[0].title}");

    for (var item in notes) {
      response.add(NoteModel(
        id: item["id"],
        title: item["title"],
        description: item["description"],
        createdAt: item["createdAt"],
        updatedAt: item["updatedAt"],
      ));
    }

    // Converting the List<Map<String, dynamic>> to List<NoteModel> and returning it
    // return notes.map((note) => NoteModel.fromMap(note)).toList();
    return response;
  }

  Future<void> insert(NoteModel note) async {
    // Getting the database
    var db = await Database.initDB();

    // Inserting the note
    // 'notes' is the table name
    await db.insert('notes', note.toInsert());
  }

  Future<void> update(NoteModel note) async {
    // Getting the database
    var db = await Database.initDB();

    // Updating the note
    // 'notes' is the table name
    await db
        .update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> delete(NoteModel note) async {
    // Getting the database
    var db = await Database.initDB();

    // Deleting the note
    // 'notes' is the table name
    await db.delete('notes', where: 'id = ?', whereArgs: [note.id]);
  }
}
