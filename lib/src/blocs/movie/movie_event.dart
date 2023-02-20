part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class FetchMovie extends MovieEvent {}

class FetchPopularMovie extends MovieEvent {}
