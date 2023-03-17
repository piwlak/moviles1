import 'package:flutter/material.dart';
import 'package:moviles1/database/database_helper.dart';
import 'package:moviles1/models/PostModel.dart';
import 'package:provider/provider.dart';
import '../provider/flags_provider.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});
  DatabaseHelper database = DatabaseHelper();
  POSTMODEL? objpost;
  @override
  Widget build(BuildContext context) {
    final txtPostCon = TextEditingController();
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    if (ModalRoute.of(context)!.settings.arguments != null) {
      objpost = ModalRoute.of(context)!.settings.arguments as POSTMODEL;
      txtPostCon.text = objpost!.descPost!;
    }
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 221,
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
            objpost == null
                ? Text(
                    'Add post',
                    style: TextStyle(fontSize: 20),
                  )
                : Text(
                    'Edit post',
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
                  if (objpost == null) {
                    database.INSERT('tblPost', {
                      'descPost': txtPostCon.text,
                      'datePost': DateTime.now().toString()
                    }).then((value) {
                      var msg =
                          value > 0 ? 'Registro insertado' : 'Ocurrio un error';
                      var snackBar = SnackBar(content: Text(msg));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    });
                  } else {
                    database.UPDATE('tblPost', {
                      'idPost': objpost?.idPost,
                      'descPost': txtPostCon.text,
                      'datePost': DateTime.now().toString()
                    }).then((value) {
                      var msg = value > 0
                          ? 'Registro Actualizado'
                          : 'Ocurrio un error';
                      var snackBar = SnackBar(content: Text(msg));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    });
                  }
                  flag.setflagpost();
                },
                child: Text('Save Post'))
          ]),
        ),
      ),
    );
  }
}
