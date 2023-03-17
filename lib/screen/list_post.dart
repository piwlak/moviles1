import 'package:flutter/material.dart';
import 'package:moviles1/database/database_helper.dart';
import 'package:moviles1/provider/flags_provider.dart';
import 'package:provider/provider.dart';
import '../models/PostModel.dart';
import '../widgets/post_widget.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  DatabaseHelper? database;
  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return FutureBuilder(
      future: flag.getflagpost() == true
          ? database!.GETALLPOST()
          : database!.GETALLPOST(),
      builder: (context, AsyncSnapshot<List<POSTMODEL>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var objpostmodel = snapshot.data![index];
              return ItemPostWidget(objpostmodel: objpostmodel);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ha ocurrido un error'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
