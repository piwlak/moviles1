import 'package:flutter/material.dart';
import 'package:moviles1/models/popularmodel.dart';
import 'package:moviles1/widgets/actor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/actor_model.dart';
import '../network/api_popular.dart';

class Movie extends StatelessWidget {
  ApiPopular apiPopular = ApiPopular();
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                popularModel!.title.toString(),
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: ThemeData().colorScheme.onBackground),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 10,
              ),
              Text(
                popularModel!.overview.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: ThemeData().colorScheme.onBackground),
                textAlign: TextAlign.justify,
              ),
              Divider(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    popularModel!.voteAverage.toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ThemeData().colorScheme.onBackground),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 223, 203, 22),
                    size: 50,
                  ),
                ],
              ),
              Divider(
                height: 10,
              ),
              FutureBuilder(
                  future: apiPopular.getIdVideo(popularModel!.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: snapshot.data.toString(),
                          flags: YoutubePlayerFlags(
                              autoPlay: true,
                              mute: false,
                              controlsVisibleAtStart: true),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.red,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              Divider(
                height: 10,
              ),
              Text(
                'Actores',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeData().colorScheme.onBackground),
              ),
              Divider(height: 10),
              FutureBuilder<List<ActorModel>?>(
                future: apiPopular.getAllAuthors(popularModel!),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          ActorModel actor = snapshot.data![index];
                          return ActorCard(
                            name: actor.name.toString(),
                            photoUrl:
                                'https://image.tmdb.org/t/p/original${actor.profilePath}',
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
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
