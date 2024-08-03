import 'package:appnotas/data/dao/note_dao.dart';
import 'package:appnotas/data/dao_factory.dart';
import 'package:appnotas/models/note_model.dart';
import 'package:appnotas/widgets/note_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Creating an instance of the NoteDao class
  NoteDao noteDao = DaoFactory.noteDao;

  // List to store all the notes
  List<NoteModel> _notes = [];

  // Text editing controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Boolean to check if the user is editing a note
  bool _isEditing = false;

  // Adding a temporary note for undo functionality
  NoteModel? _tempNote;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Getting the notes from the database
    _getNotes();
  }

  // This method gets all the notes from the database
  void _getNotes() async {
    // Getting the notes
    var notes = await noteDao.getNotes();

    // Setting the notes to the _notes list and updating the UI
    setState(() {
      _notes = notes;
    });
  }

  // This method handles the click event on the popup menu
  void _handleClick(dynamic item) {
    // Getting the note and the operation
    NoteModel note = item["note"];
    String operation = item["operation"];

    if (operation == "delete") {
      // Showing the NoteDelete dialog to confirm the deletion of the note
      _showNoteDelete(note);
    } else if (operation == "edit") {
      // Setting the _isEditing to true
      _isEditing = true;

      // Setting the title and description of the note to the text editing controllers
      _titleController.text = note.title;
      _descriptionController.text = note.description;

      // Showing the NoteManager dialog to edit the note
      // Passing the note as an argument
      _showNoteManager(
        note: note,
      );
    }
  }

  void _showUndoSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Note deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: _undoDelete,
        ),
      ),
    );
  }

  void _undoDelete() {
    // Inserting the note back to the database
    noteDao.insert(_tempNote!);

    // Clearing the _tempNote
    _tempNote = null;

    // Updating the notes list
    setState(() {
      _getNotes();
    });
  }

  // This method shows the NoteDele dialog confirming the deletion of the note
  void _showNoteDelete(NoteModel note) {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        title: Text(
          "Delete Note",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you sure you want to delete this note?",
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Clearing the text editing controllers
                    _titleController.clear();
                    _descriptionController.clear();

                    // Setting _isEditing to false
                    _isEditing = false;

                    // Closing the dialog
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    // Adding the note to the _tempNote
                    _tempNote = note;

                    // Delete note
                    NoteDao noteDao = DaoFactory.noteDao;
                    noteDao.delete(note);
                    setState(() {
                      _getNotes();
                    });

                    Navigator.pop(context);

                    // clear the text editing controllers
                    _titleController.clear();
                    _descriptionController.clear();

                    // Showing the undo snackbar
                    _showUndoSnackBar();
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // This method shows the NoteManager dialog
  // It is used to add or edit a note
  void _showNoteManager({NoteModel? note}) {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        title: Text(
          _isEditing ? "Edit Note" : "Add Note",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter title',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter description',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Clearing the text editing controllers
                    _titleController.clear();
                    _descriptionController.clear();

                    // Setting _isEditing to false
                    _isEditing = false;

                    // Closing the dialog
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (_isEditing) {
                      // Update note
                      NoteModel updatedNote = note!.copyWith(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        updatedAt: DateTime.now().toString(),
                      );
                      // Update note in database
                      setState(() {
                        noteDao.update(updatedNote);
                        _getNotes();
                      });

                      // Clearing the text editing controllers
                      _titleController.clear();
                      _descriptionController.clear();

                      // Setting _isEditing to false
                      _isEditing = false;
                    } else {
                      // Create new note
                      NoteModel newNote = NoteModel(
                        id: 0,
                        title: _titleController.text,
                        description: _descriptionController.text.isNotEmpty
                            ? _descriptionController.text
                            : "",
                        createdAt: DateTime.now().toString(),
                        updatedAt: DateTime.now().toString(),
                      );

                      // Insert note in database
                      setState(() {
                        noteDao.insert(newNote);
                        _getNotes();
                      });

                      // Clearing the text editing controllers
                      _titleController.clear();
                      _descriptionController.clear();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteManager(),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return NoteTile(note: _notes[index], handleClick: _handleClick);
        },
      ),
    );
  }
}
