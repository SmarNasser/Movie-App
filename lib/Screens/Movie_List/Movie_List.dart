import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_lab/Components/show_movie.dart';
import 'package:second_lab/Screens/Movie_List/Movie_List_Provider.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Movie List'), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.movie),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ]),
        body: ChangeNotifierProvider<MovieListProvider>(
          create: (context) => MovieListProvider(),
          child: Consumer<MovieListProvider>(
            builder: (buildContext, movieListProvider, _) {
              return (movieListProvider.movies != null)
                  ? ListView.builder(
                      itemCount: movieListProvider.movies.length,
                      itemBuilder: (context, index) {
                        final movie = movieListProvider.movies[index];
                        return ShowMovie(movie: movie);
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
