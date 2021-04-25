import 'package:flutter/material.dart';
import 'package:second_lab/Models/movies2.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowMovie extends StatefulWidget {
  final Movie movie;
  const ShowMovie({Key key, this.movie}) : super(key: key);

  @override
  _ShowMovieState createState() => _ShowMovieState();
}

class _ShowMovieState extends State<ShowMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70,
                  height: 100,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/" +
                        widget.movie.posterPath,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.movie.title,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Realese on " + widget.movie.releaseDate.toString(),
                    ),
                    Wrap(
                      spacing: 2,
                      children: List<Widget>.generate(
                          widget.movie.genreIds.length, (int idx) {
                        return Chip(
                          label: Text(widget.movie.genreIds[idx].toString()),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.grey),
                          ),
                          backgroundColor: Colors.grey[200],
                        );
                      }).toList(),
                    ),
                    RatingBar.builder(
                        initialRating: widget.movie.voteAverage,
                        direction: Axis.horizontal,
                        itemCount: 10,
                        itemSize: 20.0,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: null),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.movie.isfav = !widget.movie.isfav;
                    });
                  },
                  child: widget.movie.isfav
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30.0,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 30.0,
                        ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            height: 20,
          )
        ],
      ),
    );
  }
}
