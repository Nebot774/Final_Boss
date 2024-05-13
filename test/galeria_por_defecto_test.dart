import 'package:final_boss/repositories/GaleriaRepository.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Test fetchGaleriaDefectoData', () async {
    // Instancia de la clase GaleriaRepository
    final repository = GaleriaRepository();

    // Llama a la función fetchGaleriaDefectoData
    final result = await repository.fetchGaleriaDefectoData();

    // Imprime el cuerpo de la respuesta
    print('Response body: ${result}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
  });


}