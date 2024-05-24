import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/TierraDesdeEspacio.dart';

import 'dart:io';
import 'package:http/io_client.dart' as http_io;

import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart' as http_io;

import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart' as http_io;


class TierraDesdeEspacioRepository {
  final String baseUrl = 'http://10.0.2.2:8080/nasa';

  Future<TierraDesdeEspacio> fetchTierraDesdeEspacio(double lat, double lon, String date) async {
    var ioClient = http_io.IOClient(HttpClient()..connectionTimeout = const Duration(seconds: 30));
    final url = '$baseUrl/earth/imagery?lon=$lon&lat=$lat&date=$date';
    print('Requesting: $url');  // Imprime la URL en la consola

    final response = await ioClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body); // Imprime el contenido de la respuesta en la consola
      return TierraDesdeEspacio.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load TierraDesdeEspacio data. Server response: ${response.body}');
    }
  }
}


