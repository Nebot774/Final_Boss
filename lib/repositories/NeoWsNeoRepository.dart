import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/NeoWsNeoData.dart';

class NeoWsNeoRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';

  Future<NeoWsNeoData> fetchNeoWsNeoData(String startDate, String endDate) async {
    final response = await http.get(Uri.parse('$baseUrl/neows?startDate=$startDate&endDate=$endDate'));

    if (response.statusCode == 200) {
      return NeoWsNeoData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load NeoWsNeo data');
    }
  }
}