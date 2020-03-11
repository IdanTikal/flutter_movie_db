import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';

class GridListView extends StatelessWidget {
  final List<MovieModel> movies;
  final Function(MovieModel movieModel) onTap;
  final int gridCount;

  GridListView({Key key, this.movies, this.onTap, @required this.gridCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      addAutomaticKeepAlives: true,
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 0.5,
      ),
      children: movies
          .map((movieModel) => MovieCard(
              movieModel: movieModel,
              onTap: () => onTap(movieModel),
              gridCount: gridCount))
          .toList(),
    );
  }
}
