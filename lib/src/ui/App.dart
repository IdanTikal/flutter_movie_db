import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/assets/Strings.dart';
import 'package:flutter_movie_db/src/data/MoviesServiceApi.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesRepository.dart';

class App extends StatelessWidget {
  App(){
    get();
  }

  get() async{
    List<MovieModel> list = await MoviesRepository().getPopularMovies();
   print(list.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.app_name),
          backgroundColor: primaryColor,
        ),
      );
  }
}
