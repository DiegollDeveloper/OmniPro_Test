import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:omnipro_test/core/models/server_response.dart';

class CenterApi {
  static const String connectionError = "Error en la conexión";

  Map<String, String> get _headers {
    return {
      "Content-Type": "application/json",
    };
  }

  Future<ServerResponse> get({required String urlSpecific}) async {
    try {
      final response =
          await http.get(Uri.parse(urlSpecific), headers: _headers);
      final dataDecode = response.body != ""
          ? json.decode(utf8.decode(response.bodyBytes))
          : [];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'GET realizada con exito',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> post(
      {required dynamic data,
      required String urlSpecific,
      bool nullHeader = false}) async {
    try {
      String dataParse = data.isNotEmpty ? json.encode(data) : "";
      final response = await http.post(
        Uri.parse(urlSpecific),
        headers: (nullHeader) ? null : _headers,
        body: dataParse,
      );

      dynamic dataDecode;
      if (response.bodyBytes.isNotEmpty) {
        dataDecode = json.decode(utf8.decode(response.bodyBytes));
      }

      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          result: dataDecode,
          message: 'POST realizada con exito',
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }
}
