import 'package:flutter/material.dart';
import 'package:moviles1/database/database_helper.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});
  DatabaseHelper database = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    final txtPostCon = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 200,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Column(children: [
            Text(
              'Add post',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: txtPostCon,
              maxLines: 4,
            ),
            Divider(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  database.insert('tblPost', {
                    'descPost': txtPostCon.text,
                    'datePost': DateTime.now().toString()
                  }).then((value) {
                    var msg =
                        value > 0 ? 'Registro insertado' : 'Ocurrio un error';
                    var snackBar = SnackBar(content: Text(msg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  });
                },
                child: Text('Save Post'))
          ]),
        ),
      ),
    );
  }
}
