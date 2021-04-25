import 'package:flutter/material.dart';

import '../../Models/movies2.dart';

class MovieDetails extends StatelessWidget {
  static const imageTag = "imageTag";
  final Movie movie;

  const MovieDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(movie.title), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.movie),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ]),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    //TODO : Edit image path

                    "https://image.tmdb.org/t/p/w500/" + movie.posterPath,
                  ),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
