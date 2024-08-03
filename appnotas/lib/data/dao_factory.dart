//**
//  *  DAO Factory
//  DAO Factory is a class that provides access to all DAOs in the application.
//  This class is responsible for creating and providing access to all DAOs in the application.
//*/

import 'package:appnotas/data/dao/note_dao.dart';

class DaoFactory {
  // Creating a static instance of the NoteDao
  static NoteDao noteDao = NoteDao();
}
