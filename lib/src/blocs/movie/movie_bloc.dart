import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviiku_app/src/models/models.dart';
import 'package:moviiku_app/src/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovie>((event, emit) async {
      emit(MovieIsLoading());
      final result = await MovieService.fetchMovie();
      result.fold(
        (l) => emit(MovieIsFailed(l)),
        (r) => emit(MovieIsSuccess(r.results!)),
      );
    });
    on<FetchPopularMovie>((event, emit) async {
      emit(MovieIsLoading());
      final result = await MovieService.fetchPopularMovie();
      result.fold(
        (l) => emit(MovieIsFailed(l)),
        (r) => emit(MovieIsSuccess(r.results!)),
      );
    });
  }
}
