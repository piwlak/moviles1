import 'package:flutter/material.dart';
import 'package:moviles1/models/PostModel.dart';

class ItemPostWidget extends StatefulWidget {
  ItemPostWidget({super.key, this.objpostmodel});
  POSTMODEL? objpostmodel;

  @override
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
      height: 250,
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [avatar, txtuser, datepost],
        ),
        Row(
          children: [imgpost, desctxt],
        )
      ]),
    );
  }
}
