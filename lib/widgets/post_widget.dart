import 'package:flutter/material.dart';
import 'package:moviles1/database/database_helper.dart';
import 'package:moviles1/models/PostModel.dart';
import 'package:sqflite/sqflite.dart';

class ItemPostWidget extends StatefulWidget {
  @override
  ItemPostWidget({super.key, this.objpostmodel});
  POSTMODEL? objpostmodel;
  DatabaseHelper database = DatabaseHelper();
  State<ItemPostWidget> createState() => _ItemPostWidgetState();
}

class _ItemPostWidgetState extends State<ItemPostWidget> {
  @override
  Widget build(BuildContext context) {
    final avatar =
        CircleAvatar(backgroundImage: AssetImage('assets/ruyellrt.jpg'));
    final txtuser = Text('lorena');
    final datepost = Text('10/10/21');
    final imgpost = Image(
      image: AssetImage('assets/2.png'),
      height: 200,
    );
    final desctxt = Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ');
    final iconRate = Icon(Icons.favorite_border);
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        ListTile(
          // tileColor: Theme.of(context).colorScheme.onSecondary,
          title: txtuser,
          subtitle: datepost,
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
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
          trailing: IconButton(onPressed: () {}, icon: iconRate),
        ),
      ]),
    );
  }
}
