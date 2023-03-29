import 'package:flutter/material.dart';

import '../models/popularmodel.dart';

class ItemPopularMovie extends StatelessWidget {
  ItemPopularMovie({super.key, required this.popularModel});

  PopularModel? popularModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movie', arguments: popularModel);
      },
      child: FadeInImage(
        fit: BoxFit.fill,
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/${popularModel!.posterPath}'),
      ),
    );
  }
}
