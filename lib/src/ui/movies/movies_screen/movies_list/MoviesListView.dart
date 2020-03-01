import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/GridListView.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';

class MoviesListView extends StatelessWidget {
  final Stream<List<MovieModel>> listStream;
  final int gridCount;
  final Axis direction;
  final Function(MovieModel) onItemSelected;

  MoviesListView(
      {Key key,
      this.listStream,
      this.gridCount,
      this.direction = Axis.vertical,
      this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("moviesListView");

    return StreamBuilder<List<MovieModel>>(
        stream: listStream,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            if (gridCount != null) {
              return GridListView(movies: snapshot.data);
            } else {
              return _moviesListView(snapshot.data);
            }
          } else {
            return _emptyListView();
          }
        });
  }

  Widget _emptyListView() {
    return Center(
      child: Text("Empty List Hang On :)",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: primaryColor, fontSize: 40)),
    );
  }

  _moviesListView(List<MovieModel> movies) {
    print('_moviesListView');
    return ListView.separated(
      scrollDirection: direction,
      padding: const EdgeInsets.all(8),
      itemCount: movies.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        if (index == movies.length - 5) {
//          _loadMore();
        }
        MovieModel movieModel = movies[index];
        return MovieCard(
          movieModel: movieModel,
          onTap: ()=> onItemSelected(movieModel),
        );
      },
    );
  }
}
