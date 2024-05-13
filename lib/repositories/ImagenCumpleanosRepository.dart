import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;
import '../models/ApodData.dart';

class ImagenCumpleanosRepository {
  final String baseUrl = 'http://10.0.2.2:8080/api/nasa';

  Future<ApodData> fetchImagenCumpleanosData(String fecha) async {
    // Crear un cliente HTTP con un tiempo de espera más largo
    var ioClient = http_io.IOClient(HttpClient()..connectionTimeout = const Duration(seconds: 30));

    final response = await http.get(Uri.parse('$baseUrl/apod/$fecha'));
    //final response = await ioClient.get(Uri.parse('$baseUrl/apod/$fecha'));

    if (response.statusCode == 200) {
      return ApodData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load birthday image data');
    }
  }
}