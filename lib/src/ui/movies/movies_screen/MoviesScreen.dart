import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/assets/Strings.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/details_screen/MovieDetails.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/MoviesBloc.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MoviesListView.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoviesBloc _bloc = MoviesBloc();
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(Strings.app_name),
          backgroundColor: primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
        ),
        body: MoviesListView(
          listStream: _bloc.listObservable,
          onItemSelected: (movie) => onItemClicked(movie, context),
        ));
  }

  void onItemClicked(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetails(movieModel: movieModel)),
    );
  }
}
