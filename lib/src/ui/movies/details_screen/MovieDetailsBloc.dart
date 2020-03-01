

import 'package:flutter_movie_db/src/data/reviews/ReviewsModel.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
//  final ReviewsRepository reviewsRepo = ReviewsRepository();

  PublishSubject<List<ReviewsModel>> _reviewsSubject = new PublishSubject<List<ReviewsModel>>();
  get reviews => _reviewsSubject.stream;

  loadMoreReviews(){

  }

  dispose(){
    _reviewsSubject.close();
  }
}

final movieBloc = MovieDetailsBloc();
//enum MovieDetailsEvent { movie, error }
