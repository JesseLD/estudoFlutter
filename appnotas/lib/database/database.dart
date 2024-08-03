import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  // Database name
  static const String databaseName = 'notes.db';

  // Singleton instance of the database
  // This is used to ensure that only one instance of the database is created
  // This is done to prevent multiple instances of the database from being created
  static final Database _instance = Database._internal();

  // Database instance
  dynamic _db;

  // Factory constructor to return the singleton instance of the database
  factory Database() {
    return _instance;
  }

  // Private constructor to create the singleton instance of the database
  Database._internal();

  get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  // This method initializes the database
  // It creates a database with the name 'notes.db' and a table 'notes'

  static Future<dynamic> initDB() async {
    // Getting the default database path
    String databasePath = await getDatabasesPath();

    // Joining the database path with the database name
    String path = join(databasePath, databaseName);

    // print("path $path");
    // Opening the database

    _onCreate(dynamic db, int version) async {
      // SQL query to create the table 'notes'
      String sql = """
        CREATE TABLE notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          createdAt TEXT,
          updatedAt TEXT
        )
      """;

      // Executing the query
      await db.execute(sql);
    }

    var db = await openDatabase(
      path, // path to the database
      version: 1, // database version
      onCreate: (db, version) =>
          _onCreate(db, version), // method to run when the database is created
    );

    // Returning the database
    return db;
  }
}
