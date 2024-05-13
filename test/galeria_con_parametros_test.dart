import 'package:final_boss/repositories/GaleriaRepository.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  test('Test fetchGaleriaData', () async {
    // Instancia de la clase GaleriaRepository
    final repository = GaleriaRepository();

    // Llama a la función fetchGaleriaData con parámetros de ejemplo
    final result = await repository.fetchGaleriaData('', '2022-01-01', '2022-01-31', '', 2);

    // Imprime el cuerpo de la respuesta
    print('Response body: ${result}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
  });
}