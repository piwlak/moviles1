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
    final avatar = CircleAvatar(backgroundImage: AssetImage('assets/1.png'));
    final txtuser = Text('lorena');
    final datepost = Text('10/10/21');
    final imgpost = Image(
      image: AssetImage('assets/2.png'),
      height: 50,
    );
    final desctxt = Text('lorem');
    final iconRate = Icon(Icons.star);
    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [avatar, txtuser, datepost],
        ),
        Row(
          children: [
            imgpost,
            desctxt,
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.star)),
            Expanded(child: Container()),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  /*database.delete('tblPost', objpostmodel!.idPost!);*/
                },
                icon: Icon(Icons.delete)),
          ],
        )
      ]),
    );
  }
}
