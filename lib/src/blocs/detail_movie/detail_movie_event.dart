part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieEvent {}

class FetchDetailMovie extends DetailMovieEvent {
  final int id;

  FetchDetailMovie(this.id);
}
