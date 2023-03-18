import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar contenido'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(hintText: 'Título'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(hintText: 'Descripción'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Acción que se realiza cuando se presiona el botón "Aceptar"
            Navigator.pop(context, {
              'title': _titleController.text,
              'description': _descriptionController.text
            });
          },
          child: Text('Aceptar'),
        ),
        TextButton(
          onPressed: () {
            // Acción que se realiza cuando se presiona el botón "Cancelar"
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}
