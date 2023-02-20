part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieState {}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieIsLoading extends DetailMovieState {}

class DetailMovieIsFailed extends DetailMovieState {
  final String message;

  DetailMovieIsFailed(this.message);
}

class DetailMovieIsSuccess extends DetailMovieState {
  final Result detail;

  DetailMovieIsSuccess(this.detail);
}
