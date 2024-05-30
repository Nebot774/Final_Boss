import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/NeoWsNeoData.dart';

class NeoWsNeoRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';

  Future<NeoWsNeoData> fetchNeoWsNeoData(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/neowsid/$id'));

    if (response.statusCode == 200) {
      return NeoWsNeoData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error:no se encontro el asteroide con ese ID');
    }
  }

}