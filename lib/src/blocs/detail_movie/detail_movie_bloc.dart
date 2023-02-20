import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviiku_app/src/models/models.dart';
import 'package:moviiku_app/src/services/services.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(DetailMovieInitial()) {
    on<FetchDetailMovie>((event, emit) async {
      emit(DetailMovieIsLoading());
      final result = await MovieService.fetchDetailMovie(event.id);
      result.fold(
        (l) => emit(DetailMovieIsFailed(l)),
        (r) => emit(DetailMovieIsSuccess(r)),
      );
    });
  }
}
