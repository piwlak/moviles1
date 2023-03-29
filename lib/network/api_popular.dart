import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviles1/models/popularmodel.dart';

class ApiPopular {
  final URL =
      'https://api.themoviedb.org/3/movie/popular?api_key=25e54d8eb5bd343a889f3772cf2117b8&language=es-MX&page=1';
  Future<List<PopularModel>?> getAllPopular() async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var popular = jsonDecode(response.body)['results'] as List;
      var listpopular =
          popular.map((video) => PopularModel.fromMap(video)).toList();
      return listpopular;
    }
    return null;
  }
}
