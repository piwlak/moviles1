import 'package:flutter/material.dart';
import 'package:moviles1/database/database_helper.dart';
import 'package:moviles1/provider/flags_provider.dart';
import 'package:provider/provider.dart';
import '../models/Eventos.dart';
import '../widgets/event_widget.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({super.key});

  @override
  State<ListEvent> createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  DatabaseHelper? database;
  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return FutureBuilder(
      future: flag.getflagpost() == true
          ? database!.GETALLEVENTS()
          : database!.GETALLEVENTS(),
      builder: (context, AsyncSnapshot<List<Event>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var event = snapshot.data![index];
              return EventItem(event: event);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ha ocurrido un error'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
