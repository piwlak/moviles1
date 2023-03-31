import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/database_helper.dart';
import '../models/popularmodel.dart';
import '../provider/flags_provider.dart';

class ItemPopularMovie extends StatefulWidget {
  ItemPopularMovie({super.key, required this.popularModel});

  PopularModel popularModel;

  @override
  State<ItemPopularMovie> createState() => _ItemPopularMovieState();
}

class _ItemPopularMovieState extends State<ItemPopularMovie> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/movie',
              arguments: widget.popularModel);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${widget.popularModel.posterPath}'),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 30,
              child: FutureBuilder(
                  future: databaseHelper.searchPopular(widget.popularModel.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        icon: Icon(Icons.favorite),
                        color:
                            snapshot.data != true ? Colors.white : Colors.red,
                        onPressed: () {
                          if (snapshot.data != true) {
                            databaseHelper
                                .INSERT('tblPopularFav',
                                    widget.popularModel.toMap())
                                .then((value) => flag.setflagpost());
                          } else {
                            databaseHelper
                                .DELETE('tblPopularFav',
                                    widget.popularModel.id!, 'id')
                                .then((value) => flag.setflagpost());
                          }
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
