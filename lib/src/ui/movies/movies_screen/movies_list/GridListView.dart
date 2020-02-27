import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';

class GridListView extends StatefulWidget {
  final Stream<List<MovieModel>> observableList;

  GridListView({Key key, this.observableList}) : super(key: key);

  @override
  _GridListViewState createState() => _GridListViewState();
}

class _GridListViewState extends State<GridListView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieModel>>(
        stream: widget.observableList,
        builder: (context, snapshot) {
          return GridView(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            children: snapshot.data.map((movieModel) => MovieCard(movieModel: movieModel)).toList(),
          );
        });
  }
}
