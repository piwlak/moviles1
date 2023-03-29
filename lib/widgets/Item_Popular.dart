import 'package:flutter/material.dart';

import '../models/popularmodel.dart';

class ItemPopularMovie extends StatelessWidget {
  ItemPopularMovie({super.key, required this.popularModel});

  PopularModel? popularModel;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        fit: BoxFit.fill,
        placeholder: const AssetImage('assets/loading1.gif'),
        image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/${popularModel!.posterPath}'));
  }
}
