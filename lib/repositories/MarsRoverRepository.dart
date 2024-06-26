// repository/mars_rover_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/MarsRover.dart';
import '../models/MissionManifest.dart';

class MarsRoverRepository {
  final String baseUrl;

  MarsRoverRepository({required this.baseUrl});

  Future<List<MarsRoverPhoto>> fetchMarsRoverPhotos(String rover, String earthDate, String camera) async {
    final url = Uri.parse('$baseUrl/rovers/$rover/photos?earth_date=$earthDate&camera=$camera&api_key=9dgFAENW1dghiXqP2wPmdCDEOsCAISYbrm3XW2tc');

    // Imprime la URL completa
    print('URL: $url');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final marsRover = MarsRover.fromJson(jsonResponse);
      return marsRover.photos;
    } else {
      throw Exception('Failed to load Mars Rover photos');
    }
  }

  Future<MissionManifest> getMissionManifest(String roverName) async {
    final url = Uri.parse('$baseUrl/manifests/$roverName?api_key=9dgFAENW1dghiXqP2wPmdCDEOsCAISYbrm3XW2tc');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return MissionManifest.fromJson(data);
      } else {
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load mission manifest');
      }
    } catch (e) {
      print('Caught error: $e');
      if (e is http.ClientException) {
        print('HTTP Client issues found. Please check the API endpoint and parameters.');
      } else if (e is FormatException) {
        print('Format issues found. Please check the API response format.');
      }
      // Lanza la excepción de nuevo para que pueda ser manejada en otra parte
      throw e;
    }
  }


}