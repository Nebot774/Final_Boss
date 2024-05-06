import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/GaleriaData.dart';

class GaleriaRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';

  Future<GaleriaData> fetchGaleriaDefectoData() async {
    final response = await http.get(Uri.parse('$baseUrl/galeriadefecto'));

    if (response.statusCode == 200) {
      print('Response data: ${response.body}'); // Imprime los datos de la respuesta
      return GaleriaData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load default gallery data');
    }
  }

  Future<GaleriaData> fetchGaleriaData(String query, String startDate, String endDate, String mediaType) async {
    final response = await http.get(Uri.parse('$baseUrl/galeria?query=$query&start_date=$startDate&end_date=$endDate&media_type=$mediaType'));

    if (response.statusCode == 200) {
      return GaleriaData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load gallery data');
    }
  }

}