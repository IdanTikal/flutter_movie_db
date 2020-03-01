import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_movie_db/src/ui/movies/movies_screen/MoviesScreen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("App");
    return MoviesScreen();
  }

}

