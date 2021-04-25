import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:second_lab/Models/movies2.dart';

class MovieService {
  Future<List<Movie>> getAllMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc'));
    if (response.statusCode == 200) {
      return List<Movie>.from((json.decode(response.body)["results"] as List)
          .map((e) => Movie.fromJson(e))).toList();
    } else {
      throw Exception('Failed to load Movies');
    }
  }
}
