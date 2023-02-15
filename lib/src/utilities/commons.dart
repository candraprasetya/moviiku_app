part of 'utilities.dart';

class Commons {
  static String getApiKey() {
    String apiKey = dotenv.get('API_KEY', fallback: '');
    return apiKey;
  }

  static String getBaseUrl() {
    String baseUrl = dotenv.get('BASE_URL', fallback: '');
    return baseUrl;
  }

  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(color: Colors.black),
    )));
  }
}
