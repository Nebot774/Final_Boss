import 'dart:convert';

import 'package:final_boss/models/ApodData.dart';
import 'package:final_boss/repositories/ApodRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart'; // Para el cliente de pruebas


void main() {
  test('Test fetchApodData', () async {
    // Crear una instancia de ApodRepository utilizando un cliente http de prueba
    final repository = ApodRepository(
      client: MockClient((request) async {
        // Simular una respuesta HTTP
        final response = {
          'date': '2024-05-25',
          'explanation': 'Explanation of the image',
          'media_type': 'image',
          'service_version': 'v1',
          'title': 'Astronomy Picture of the Day',
          'url': 'https://example.com/image.jpg',
          'copyright': 'NASA',
        };
        return http.Response(jsonEncode(response), 200);
      }),
    );

    // Llama a la función fetchApodData
    final result = await repository.fetchApodData();

    // Imprime el cuerpo de la respuesta
    print('Response body:');
    print('Date: ${result.date}');
    print('Explanation: ${result.explanation}');
    print('Title: ${result.title}');
    print('URL: ${result.url}');
    print('Copyright: ${result.copyright}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
    expect(result, isA<ApodData>());
    expect(result.title, 'Astronomy Picture of the Day');
    expect(result.url, 'https://example.com/image.jpg');
  });
}

