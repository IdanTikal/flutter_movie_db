import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/assets/Strings.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/GridListView.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';
import 'package:parallax_image/parallax_image.dart';

class MoviesListView extends StatefulWidget {
  final Stream<List<MovieModel>> listStream;
  final int gridCount;
  final Axis direction;

  MoviesListView({Key key, this.listStream, this.gridCount, this.direction}) : super(key: key);

  @override
  _MoviesListViewState createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<List<MovieModel>>(
          stream: widget.listStream,
          builder: (context, snapshot) {
            return moviesListView(snapshot);
          }),
    );
  }

moviesListView(AsyncSnapshot<List<MovieModel>> snapshot) {
  if (snapshot.hasData) {
    Axis direction = widget.direction is Axis ? widget.direction : Axis.vertical;
    if (widget.gridCount != null ){
      return GridListView();
    }
//    return getGrid(snapshot.data);
    return ListView.separated(
      scrollDirection: direction,
      padding: const EdgeInsets.all(8),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == snapshot.data.length - 5) {
//          _loadMore();
        }
        return MovieCard(movieModel: snapshot.data[index], direction: direction,);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  } else {
    return Center(
      child: Text("Empty List Hang On :)",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: primaryColor, fontSize: 40)),
    );
  }
}
}
