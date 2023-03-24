import 'package:flutter/material.dart';

import '../models/popularmodel.dart';

class ItemPopular extends StatelessWidget {
  ItemPopular({super.key, required this.popularmodel});

  Popularmodel popularmodel;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        fit: BoxFit.fill,
        placeholder: const AssetImage('1.png'),
        image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/{$popularmodel.posterPath}'));
  }
}
