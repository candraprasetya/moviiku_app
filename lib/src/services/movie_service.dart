part of 'services.dart';

class MovieService {
  static Future<Either<String, ListMovieModel>> fetchMovie() async {
    final response = await ApiHelper.get(Enpoints.nowPlaying,
        param: {'api_key': Commons.getApiKey()});
    return response.fold(
        (l) => left(l), (r) => right(listMovieModelFromMap(r)));
  }

  static Future<Either<String, ListMovieModel>> fetchPopularMovie() async {
    final response = await ApiHelper.get(Enpoints.popular,
        param: {'api_key': Commons.getApiKey()});
    return response.fold(
        (l) => left(l), (r) => right(listMovieModelFromMap(r)));
  }

  static Future<Either<String, Result>> fetchDetailMovie(int id) async {
    final response = await ApiHelper.get("${Enpoints.movie}/$id",
        param: {'api_key': Commons.getApiKey()});
    return response.fold((l) => left(l), (r) => right(movieModelFromMap(r)));
  }

  static Future<void> fetchAllProduct() async {
    final response = await ApiHelper.getStore(
      "${Enpoints.store}",
    );
    print(response);
  }

  static Future<void> addProduct() async {
    final response = await ApiHelper.post("${Enpoints.users}", param: {
      "email": "Cand@gmail.com",
      "username": "candra",
      "password": "12345678",
    });
    print(response);
  }

  static Stream<int> pointStream() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }
}
