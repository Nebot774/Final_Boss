import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/ApodData.dart';

class ImagenCumpleanosRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';

  Future<ApodData> fetchImagenCumpleanosData(String fecha) async {
    final response = await http.get(Uri.parse('$baseUrl/apod/$fecha'));

    if (response.statusCode == 200) {
      return ApodData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load birthday image data');
    }
  }
}