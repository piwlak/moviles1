import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moviles1/routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/PostModel.dart';

class DatabaseHelper {
  static final nameDB = 'SOCIALITECDB';
  static final versionDB = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initdatabase();
  }

  _initdatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''Create Table tblPost (
      idPost integer primary key, 
      descPost varchar(200),
      datePost date
    );''';
    db.execute(query);
  }

  Future<int> insert(String tblname, Map<String, dynamic> data) async {
    var conn = await database;
    return conn.insert(tblname, data);
  }

  Future<int> upadate(String tblname, Map<String, dynamic> data) async {
    var conn = await database;
    return conn.update(tblname, data,
        where: 'idPost = ?', whereArgs: [data['idPost']]);
  }

  Future<int> delete(String tblname) async {
    var conn = await database;
    return conn.delete(tblname, where: 'idPost = ?', whereArgs: ['idPost']);
  }

  Future<List<POSTMODEL>> GETALLPOST() async {
    var conn = await database;
    var result = await conn.query('tblPost');
    return result.map((post) => POSTMODEL.fromMap(post)).toList();
  }
}
