import 'dart:convert';
import 'package:ecommerce_app/utils/constants/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams),
      headers: _headers(),
    );

    return _handleResponse(response);
  }

Future<dynamic> post(
    String endpoint,
     {
      Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: queryParams);

    final response = await http.post(
      uri,
      headers: _headers(),
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: _headers(),
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: _headers(),
    );

    return _handleResponse(response);
  }

  Map<String, String> _headers() {
    final headers = {"Content-Type": "application/json"};

    if (authResponse != null) {
      headers["Authorization"] = "Bearer ${authResponse!.customerdata?.token}";
    }

    return headers;
  }

  dynamic _handleResponse(http.Response response) {
    final decoded = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return decoded;

      case 400:
        throw Exception(decoded["message"] ?? "Bad Request");

      case 401:
        throw Exception("Unauthorized");

      case 500:
        throw Exception("Server Error");

      default:
        throw Exception("Something went wrong");
    }
  }
}
