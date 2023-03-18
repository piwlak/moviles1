import 'dart:io';
import 'package:moviles1/models/Eventos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moviles1/models/PostModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final nameDB = 'SOCIALDB';
  static final versionDB = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    await db.execute('''CREATE TABLE tblPost (
      idPost INTEGER PRIMARY KEY,
      descPost VARCHAR(200),
      datePost DATE)
      ''');

    await db.execute('''CREATE TABLE tblevents (
        idEvent INTEGER PRIMARY KEY,
        titleE varchar(20),
        descEvent TEXT,
        dateEvent DATE,
        chkEvent int
      )''');
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.update(tblName, data,
        where: 'idPost = ?', whereArgs: [data['idPost']]);
  }

  Future<int> DELETE(String tblName, int idPost) async {
    var conexion = await database;
    return conexion.delete(tblName, where: 'idPost = ?', whereArgs: [idPost]);
  }

  Future<List<POSTMODEL>> GETALLPOST() async {
    var conexion = await database;
    var result = await conexion.query('tblPost');
    return result.map((post) => POSTMODEL.fromMap(post)).toList();
  }

  Future<List<Event>> GETALLEVENTS() async {
    var conexion = await database;
    var result = await conexion.query('tblevents');
    return result.map((event) => Event.fromMap(event)).toList();
  }
}
