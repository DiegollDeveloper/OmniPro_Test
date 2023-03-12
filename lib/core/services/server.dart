import 'package:flutter_dotenv/flutter_dotenv.dart';

class Server {
  static String serverUrl = dotenv.env["SERVER_URL"]!;

  // Endpoints
  static final String _serverPhotos = serverUrl + dotenv.env["SERVER_PHOTOS"]!;

  // Full url
  static String retrieveApiPhotosEndpoint(String filter) =>
      "$_serverPhotos$filter";
}
