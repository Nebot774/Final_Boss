import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/NeoWsData.dart';

class NeoWsRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';

  Future<NeoWsData> fetchNeoWsData(String startDate, String endDate) async {
    final response = await http.get(Uri.parse('$baseUrl/neows?startDate=' + startDate.trim() + '&endDate=' + endDate.trim()));

    if (response.statusCode == 200) {
      return NeoWsData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load NeoWs data. Server response: ${response.body}');
    }
  }
}