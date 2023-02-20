part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
//NamaBloc + State ==> Movie + IsLoading atau Movie + IsFailed

class MovieIsLoading extends MovieState {}

class MovieIsFailed extends MovieState {
  final String message;
  MovieIsFailed(this.message);
}

class MovieIsSuccess extends MovieState {
  final List<Result> movieList;

  MovieIsSuccess(this.movieList);
}
