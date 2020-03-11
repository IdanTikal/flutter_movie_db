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
          actions: renderAppBarActions(_bloc),
          title: Text(Strings.app_name),
          backgroundColor: primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
        ),
        body: StreamBuilder(
          initialData: 1,
          stream: _bloc.listItemCountObservable,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return MoviesListView(
              gridCount: snapshot.data,
              parallax: true,
              listStream: _bloc.listObservable,
              onItemSelected: (movie) => onItemClicked(movie, context),
              direction: Axis.vertical,
            );
          },
        ));
  }

  List<Widget> renderAppBarActions(MoviesBloc bloc) {
    return <Widget>[
      // action button
      IconButton(
        icon: Icon(Icons.grid_on),
        onPressed: () {
          bloc.changeListItemCount();
        },
      ),
      // action button
/*      IconButton(
        icon: Icon(choices[1].icon),
        onPressed: () {
          _select(choices[1]);
        },
      ),*/
      // overflow menu
/*      PopupMenuButton<Choice>(
        onSelected: _select,
        itemBuilder: (BuildContext context) {
          return choices.skip(2).map((Choice choice) {
            return PopupMenuItem<Choice>(
              value: choice,
              child: Text(choice.title),
            );
          }).toList();
        },
      ),*/
    ];
  }

  void onItemClicked(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetails(movieModel: movieModel)),
    );
  }
}
