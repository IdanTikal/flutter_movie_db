import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/assets/Strings.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesRepository.dart';
import 'package:flutter_movie_db/src/ui/movies/movies_screen/movies_list/ParallaxList.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:rxdart/rxdart.dart';

class App extends StatelessWidget {
  BehaviorSubject _listSubject = new BehaviorSubject<List<MovieModel>>();

  get listObservable => _listSubject.stream;

  App() {
    _loadMore();
  }

  _loadMore() async {
    List<MovieModel> list = await MoviesRepository().getPopularMovies();
    _listSubject.sink.add(list);
  }

//  @override
//  Widget build(BuildContext context) {
//    return CustomScrollView(slivers: <Widget>[
//      SliverAppBar(
//        backgroundColor: primaryColor,
//        pinned: true,
//        expandedHeight: 150.0,
//        flexibleSpace: FlexibleSpaceBar(
//          title: Text(Strings.app_name),
//        ),
//      ),
//      SliverGrid(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 4,
//          mainAxisSpacing: 10.0,
//          crossAxisSpacing: 10.0,
//          childAspectRatio: 1.0,
//        ),
//        delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//            return Container(
//              alignment: Alignment.center,
//              color: Colors.teal[100 * (index % 9)],
//              child: Text('Grid Item $index'),
//            );
//          },
//          childCount: 50,
//        ),
//      ),
//      SliverFixedExtentList(
//        itemExtent: 50.0,
//        delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//            return Container(
//              alignment: Alignment.center,
//              color: Colors.lightBlue[100 * (index % 9)],
//              child: Text('List Item $index'),
//            );
//          },
//        ),
//      ),
//    ]);
//  }
  @override
  Widget build(BuildContext context) {
    return ParallaxList(listObservable);
  }
}

