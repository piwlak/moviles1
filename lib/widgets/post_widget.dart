import 'package:flutter/material.dart';
import 'package:moviles1/database/database_helper.dart';
import 'package:moviles1/models/PostModel.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../provider/flags_provider.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objpostmodel});
  POSTMODEL? objpostmodel;
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final avatar =
        CircleAvatar(backgroundImage: AssetImage('assets/ruyellrt.jpg'));
    final txtuser = Text(
      'lorena',
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    );
    final datepost = Text('10/10/21',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary));
    final imgpost = Image(
      image: AssetImage('assets/2.png'),
      height: 200,
    );
    final desctxt = Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary));
    final iconRate = Icon(Icons.favorite_border);
    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        ListTile(
          tileColor: Theme.of(context).colorScheme.onSecondary,
          title: txtuser,
          subtitle: datepost,
          trailing: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('confirmar Borrado'),
                        content: const Text('deseas borrar la publicacion?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                database
                                    .delete('tblPost', objpostmodel!.idPost!)
                                    .then((value) => flag.setflagpost());
                                Navigator.pop(context);
                              },
                              child: Text('Ok')),
                          TextButton(onPressed: () {}, child: Text('Cancelar')),
                        ],
                      ));
            },
            icon: Icon(Icons.more_vert),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          leading: avatar,
        ),
        Center(
          child: imgpost,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: desctxt,
        ),
        ListTile(
          trailing: IconButton(
              onPressed: () {},
              icon: iconRate,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ]),
    );
  }
}
