import 'package:flutter/material.dart';

import '../models/popularmodel.dart';
import '../network/api_popular.dart';
import '../widgets/Item_Popular.dart';

class ListPopularVideos extends StatefulWidget {
  const ListPopularVideos({super.key});

  @override
  State<ListPopularVideos> createState() => _ListPopularVideosState();
}

class _ListPopularVideosState extends State<ListPopularVideos> {
  @override
  ApiPopular? api;
  void initState() {
    super.initState();
    api = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Popular'),
      ),
      body: FutureBuilder(
        future: api!.getAllPopular(),
        builder: (context, AsyncSnapshot<List<Popularmodel>?> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              itemBuilder: (context, index) {
                return ItemPopular(popularmodel: snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
