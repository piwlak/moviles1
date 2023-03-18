import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/database_helper.dart';
import '../models/Eventos.dart';
import '../provider/flags_provider.dart';

class EventItem extends StatelessWidget {
  EventItem({super.key, this.event});
  Event? event;
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final desc =
        'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum';
    final date = Text('10/10/21',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary));
    final complete = 0;
    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return ListTile(
      tileColor: Theme.of(context).colorScheme.onSecondary,
      title: Text('titulo'),
      subtitle: Text(date.toString()),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text('Detalles'), content: Text(desc)));
      },
      trailing: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Confirmar Borrado'),
                    content: const Text('deseas borrar la publicacion?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            database
                                .DELETE('tblevents', event!.idEvent!)
                                .then((value) => flag.setflagpost());
                            Navigator.pop(context);
                          },
                          child: Text('Ok')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar')),
                    ],
                  ));
        },
        icon: Icon(Icons.delete),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
