import 'package:flutter/cupertino.dart';
import 'package:second_lab/Models/movies2.dart';
import 'package:second_lab/Repository/Movie_Repository.dart';

class MovieListProvider extends ChangeNotifier {
  List<Movie> movies;

  MovieRepositry _movieRepositry = MovieRepositry();

  MovieListProvider() {
    getMovies();
  }

  void getMovies() {
    _movieRepositry.getAllMovies().then((newMovie) {
      movies = newMovie;
      notifyListeners();
    });
  }
}
