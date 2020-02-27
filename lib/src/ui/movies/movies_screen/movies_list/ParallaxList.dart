import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/assets/Strings.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/details_screen/MovieDetails.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/MovieCard.dart';
import 'package:parallax_image/parallax_image.dart';

class ParallaxList extends StatefulWidget {
  final Stream<List<MovieModel>> listStream;

  ParallaxList(this.listStream);

  @override
  _ParallaxListState createState() => _ParallaxListState();
}

class _ParallaxListState extends State<ParallaxList> {
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
            return getListView(snapshot);
          }),
    );
  }

  getListView(AsyncSnapshot<List<MovieModel>> snapshot) {
    if (snapshot.hasData) {
//    return getGrid(snapshot.data);
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == snapshot.data.length - 5) {
//          _loadMore();
          }
          MovieModel movieModel = snapshot.data[index];
          return MovieCard(
            movieModel: movieModel,
            onTap: ()=> onItemClicked(movieModel),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    } else {
      return Center(
        child: Text("Empty List Hang On :)",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 40)),
      );
    }
  }

  void onItemClicked(MovieModel movieModel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetails(movieModel: movieModel, photoUrl: movieModel.getPosterDownloadUrl,)),
    );
  }
}
