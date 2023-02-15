part of 'services.dart';

class MovieService {
  static Future<Either<String, ListMovieModel>> fetchMovie() async {
    final response = await ApiHelper.get(Enpoints.nowPlaying,
        param: {'api_key': Commons.getApiKey()});
    return response.fold(
        (l) => left(l), (r) => right(listMovieModelFromMap(r)));
  }

  static Future<Either<String, Result>> fetchDetailMovie(int id) async {
    final response = await ApiHelper.get("${Enpoints.movie}/$id",
        param: {'api_key': Commons.getApiKey()});
    return response.fold((l) => left(l), (r) => right(movieModelFromMap(r)));
  }
}