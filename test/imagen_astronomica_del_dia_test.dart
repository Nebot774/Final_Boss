import 'package:final_boss/repositories/ApodRepository.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Test fetchApodData', () async {
    // Instancia de la clase ApodRepository
    final repository = ApodRepository();

    // Llama a la función fetchApodData
    final result = await repository.fetchApodData();

    // Imprime el cuerpo de la respuesta
    print('Response body: ${result}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
  });
}