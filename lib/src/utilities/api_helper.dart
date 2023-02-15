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

    return right(returnResponse(response));
  }
}

dynamic returnResponse(http.Response response) {
  String responseJson = response.body;
  final jsonResponse = jsonDecode(responseJson);
  switch (response.statusCode) {
    case 200:
      return responseJson;
    case 500:
    default:
      throw FetchDataException(jsonResponse['message'] ?? '');
  }
}
