import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/ApodData.dart';


class ApodRepository {
  final String baseUrl = 'http://localhost:8080/api';

  Future<ApodData> fetchApodData() async {
    final response = await http.get(Uri.parse('$baseUrl/apod'));

    if (response.statusCode == 200) {
      return ApodData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load APOD data');
    }
  }
}