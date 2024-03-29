import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) =>
//     List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

// // String welcomeToJson(List<Welcome> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Welcome {
//   Welcome({
//     this.title,
//     this.image,
//     this.rating,
//     this.releaseYear,
//     this.genre,
//     this.selected = false,
//   });

//   String title;
//   String image;
//   double rating;
//   int releaseYear;
//   List<String> genre;
//   bool selected;

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         title: json["title"],
//         image: json["image"],
//         rating: json["rating"].toDouble(),
//         releaseYear: json["releaseYear"],
//         genre: List<String>.from(json["genre"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "image": image,
//         "rating": rating,
//         "releaseYear": releaseYear,
//         "genre": List<dynamic>.from(genre.map((x) => x)),
//       };
// }

Movie welcomeFromJson(String str) => Movie.fromJson(json.decode(str));

String welcomeToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  bool isfav = false;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  num popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  num voteAverage;
  num voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
