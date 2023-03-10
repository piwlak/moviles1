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
          height: 350,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withOpacity(0.4),
              border: Border.all(color: Colors.black)),
          child: Column(children: [
            Text('add post'),
            TextFormField(
              controller: txtPostCon,
              maxLines: 8,
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
