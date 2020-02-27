import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';

class GridViewList extends StatefulWidget {
  final Stream<List<MovieModel>> _observableList;

  GridViewList(this._observableList);

  @override
  _GridViewListState createState() => _GridViewListState();
}

class _GridViewListState extends State<GridViewList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieModel>>(
        stream: widget._observableList,
        builder: (context, snapshot) {
          return GridView(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            children: snapshot.data.map((movieModel) => MovieCard(movieModel: movieModel,)).toList(),
          );
        });
  }
}
