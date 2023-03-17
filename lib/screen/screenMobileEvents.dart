import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Database> _database;
  bool _showCalendarView = true;

  final TextEditingController _eventController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  List<Map<String, dynamic>> _events = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
    _refreshEvents();
  }

  Future<void> _initDatabase() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'events_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE events(id INTEGER PRIMARY KEY, dscEvento TEXT, fechaEvento TEXT, completado INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> _insertEvent(String description, DateTime date) async {
    final Database db = await _database;
    final String formattedDate = _dateFormat.format(date);
    await db.insert(
      'events',
      {'dscEvento': description, 'fechaEvento': formattedDate, 'completado': 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _refreshEvents();
  }

  Future<void> _refreshEvents() async {
    final Database db = await _database;
    final List<Map<String, dynamic>> events = await db.query('events');
    setState(() {
      _events = events;
    });
  }

  Widget _buildEventList() {
    return ListView.builder(
      itemCount: _events.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> event = _events[index];
        final String description = event['dscEvento'];
        final String date = event['fechaEvento'];
        final bool completed = event['completado'] == 1;
        return ListTile(
          title: Text(description),
          subtitle: Text(date),
          leading: Icon(
            completed ? Icons.done : Icons.event,
            color: completed ? Colors.green : Colors.grey,
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              final Database db = await _database;
              await db
                  .delete('events', where: 'id = ?', whereArgs: [event['id']]);
              _refreshEvents();
            },
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => EventDetailPage(event: event)),
            // );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
