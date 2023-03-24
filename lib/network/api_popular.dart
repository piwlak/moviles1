import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviles1/models/popularmodel.dart';

class ApiPopular {
  Uri link = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=0cb894064f40656f3575e8ccae3d8d73&language=es-MX&page=1');
  Future<List<Popularmodel>?> getAllPopular() async {
    var res = await http.get(link);
    var arrJSON = jsonDecode(res.body)['results'] as List;
    if (res.statusCode == 200) {
      return arrJSON.map((popular) => Popularmodel.fromMap(popular)).toList();
    } else {
      return null;
    }
  }
}
