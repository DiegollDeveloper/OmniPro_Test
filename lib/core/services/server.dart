import 'package:flutter_dotenv/flutter_dotenv.dart';

class Server {
  static String serverUrl = dotenv.env["server_url"]!;

  // Endpoints
  static final String _serverPhotos = serverUrl + dotenv.env["server_photos"]!;

  // Full url
  static String registerPassengerEndpoint(String filter) =>
      "$_serverPhotos$filter";
}
