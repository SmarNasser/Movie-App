import 'package:second_lab/Services/Movie_Service.dart';
import '../Models/movies2.dart';

class MovieRepositry {
  MovieService _movieService = MovieService();

  Future<List<Movie>> getAllMovies() {
    return _movieService.getAllMovies();
  }
}
