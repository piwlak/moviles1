import 'package:flutter/material.dart';
import 'package:moviles1/models/popularmodel.dart';

class Movie extends StatelessWidget {
  Movie({super.key});
  PopularModel? popularModel;
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      popularModel = ModalRoute.of(context)!.settings.arguments as PopularModel;
      return Stack(
        children: [
          Positioned(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    opacity: 0.2,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/${popularModel!.posterPath}'))),
          )),
          Positioned(
              child: Column(
            children: [
              Text(
                popularModel!.title.toString(),
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
              Divider(
                height: 10,
              ),
              Text(
                popularModel!.overview.toString(),
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ],
          ))
        ],
      );
    }
    return Container(
      child: Text('error'),
    );
  }
}
