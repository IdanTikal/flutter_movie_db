import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';

class GridListView extends StatelessWidget {
  final List<MovieModel> movies;

  GridListView({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return GridView(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            children: movies.map((movieModel) => MovieCard(movieModel: movieModel)).toList(),
          );
  }
}
