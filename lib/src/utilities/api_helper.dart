part of 'utilities.dart';

class ApiHelper {
  static Future<Either<String, dynamic>> get(String endPoint,
      {Map<String, dynamic>? param}) async {
    final uri = Uri.https(Commons.getBaseUrl(), endPoint, param);
    late http.Response response;
    try {
      response = await http.get(
        uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
    } on SocketException {
      throw left(FetchDataException('No Internet'));
    } on FormatException {
      throw left(FetchDataException('Bad Response'));
    }

    return returnResponse(response);
  }

  static Future<Either<String, dynamic>> getStore(String endPoint,
      {Map<String, dynamic>? param}) async {
    final uri = Uri.https(Commons.getBaseUrlStore(), endPoint, param);
    late http.Response response;
    try {
      response = await http.get(
        uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
    } on SocketException {
      throw left(FetchDataException('No Internet'));
    } on FormatException {
      throw left(FetchDataException('Bad Response'));
    }

    return returnResponse(response);
  }

  static Future<Either<String, dynamic>> post(String endPoint,
      {Map<String, dynamic>? param}) async {
    final uri = Uri.https(Commons.getBaseUrlStore(), endPoint, param);
    late http.Response response;
    try {
      response = await http.post(
        uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
    } on SocketException {
      throw left(FetchDataException('No Internet'));
    } on FormatException {
      throw left(FetchDataException('Bad Response'));
    }

    return returnResponse(response);
  }
}

Either<String, dynamic> returnResponse(http.Response response) {
  String responseJson = response.body;
  final jsonResponse = jsonDecode(responseJson);
  switch (response.statusCode) {
    case 200:
      return right(responseJson);
    case 500:
    default:
      throw left(jsonResponse['message'] ?? 'Error Guys');
  }
}
