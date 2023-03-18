import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviles1/models/Eventos.dart';
import 'package:moviles1/widgets/appbar_widget.dart';
import 'package:moviles1/widgets/event_widget.dart';
import 'package:provider/provider.dart';
import '../database/database_helper.dart';
import '../provider/flags_provider.dart';
import '../routes.dart';
import 'listevents.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DatabaseHelper database = DatabaseHelper();
  Event? event;

  @override
  Widget build(BuildContext context) {
    FlagsProvider flags = Provider.of<FlagsProvider>(context);
    final txtDescEvent = TextEditingController();
    return Scaffold(
        appBar: Appbar_Widget(),
        body:
            flags.getflagpost() == true ? const ListEvent() : const ListEvent(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: event == null
                          ? Text('Adding Event')
                          : Text('Editing Event'),
                      content: SizedBox(
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: txtDescEvent,
                            ),
                            IconButton(
                                onPressed: () {
                                  if (event == null) {
                                    database.INSERT('tblevents', {
                                      'descEvent': txtDescEvent.text,
                                      'dateEvent': DateTime.now().toString(),
                                      'chkEvent': 0
                                    }).then((value) {
                                      var msg =
                                          value > 0 ? 'Insertado' : 'Error';
                                      final snackBar =
                                          SnackBar(content: Text(msg));
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      flags.setflagpost();
                                    });
                                  } else {
                                    database.UPDATE('tblevents', {
                                      'idPost': event!.idEvent,
                                      'descEvent': txtDescEvent.text,
                                      'dateEvent': DateTime.now().toString(),
                                    }).then((value) {
                                      var msg =
                                          value > 0 ? 'Actualizado' : 'Error';
                                      final snackBar =
                                          SnackBar(content: Text(msg));
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      flags.setflagpost();
                                    });
                                  }
                                },
                                icon: const Icon(Icons.add))
                          ],
                        ),
                      ),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ));
            flags.setflagpost();
          },
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.background,
          ),
          label: Text(
            'Add',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        ));
  }
}
