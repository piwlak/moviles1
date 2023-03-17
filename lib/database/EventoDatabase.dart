import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/Eventos.dart';

class EventoDatabase {
  static final EventoDatabase instance = EventoDatabase._init();
  static Database? _database;

  EventoDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('eventos.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE eventos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT,
        fecha TEXT,
        completado INTEGER
      )
    ''');
  }

  Future<int> create(Evento evento) async {
    final db = await instance.database;

    final id = await db!.insert('eventos', evento.toMap());
    return evento.copy(id: id);
  }

  Future<List<Evento>> getAll() async {
    final db = await instance.database;

    final result = await db!.query('eventos');
    return result.map((e) => Evento.fromMap(e)).toList();
  }
}
