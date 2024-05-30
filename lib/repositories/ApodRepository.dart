import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/ApodData.dart';

class ApodRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';
  final http.Client client;

  ApodRepository({required this.client});

  Future<ApodData> fetchApodData() async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/apod'));

      if (response.statusCode == 200) {
        return ApodData.fromJson(jsonDecode(response.body));
      } else {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Error al Cargar la Imagen Astronomica del Dia');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
