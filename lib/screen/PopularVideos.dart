import 'package:moviles1/models/popularmodel.dart';
import 'package:moviles1/network/api_popular.dart';
import 'package:flutter/material.dart';
import '../widgets/Item_Popular.dart';

class PopulaMoviesScreen extends StatefulWidget {
  const PopulaMoviesScreen({super.key});

  @override
  State<PopulaMoviesScreen> createState() => _PopulaMoviesScreenState();
}

class _PopulaMoviesScreenState extends State<PopulaMoviesScreen> {
  ApiPopular? apiPopular;
  @override
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
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
          }),
    );
  }
}
