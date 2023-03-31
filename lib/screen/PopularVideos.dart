import 'package:moviles1/models/popularmodel.dart';
import 'package:moviles1/network/api_popular.dart';
import 'package:flutter/material.dart';
import 'package:moviles1/screen/MovieDetail.dart';
import 'package:provider/provider.dart';
import '../database/database_helper.dart';
import '../provider/flags_provider.dart';
import '../widgets/Item_Popular.dart';

class PopulaMoviesScreen extends StatefulWidget {
  const PopulaMoviesScreen({super.key});

  @override
  State<PopulaMoviesScreen> createState() => _PopulaMoviesScreenState();
}

class _PopulaMoviesScreenState extends State<PopulaMoviesScreen> {
  ApiPopular? apiPopular;
  bool isFavoriteView = false;
  DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas Populares'),
        actions: [
          IconButton(
            icon: isFavoriteView != true
                ? Icon(Icons.favorite_border_outlined)
                : Icon(Icons.list),
            onPressed: () {
              setState(() {
                isFavoriteView = !isFavoriteView;
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: flag.getflagpost() == true
              ? isFavoriteView
                  ? database!.getAllPopular()
                  : apiPopular!.getAllPopular()
              : isFavoriteView
                  ? database!.getAllPopular()
                  : apiPopular!.getAllPopular(),
          builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  PopularModel popularModel = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => MovieDetail(
                            popularModel: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: snapshot.data![index].id!,
                      child:
                          ItemPopularMovie(popularModel: snapshot.data![index]),
                    ),
                  );
                  //return ItemPopular(popularModel: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('OCURRIO UN ERROR' + snapshot.error.toString()),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

/*FutureBuilder(
          future: apiPopular!.getAllPopular(),
          builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
            return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: .8,
                    crossAxisSpacing: 10),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    return ItemPopularMovie(
                        popularModel: snapshot.data![index]);
                  } else if (snapshot.hasError) {
                    return const Text('ALGO FALLO');
                  } else {
                    return const CircularProgressIndicator();
                  }
                });
          }), */
