import 'package:final_boss/repositories/NeoWsRepository.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Test fetchNeoWsData', () async {
    // Instancia de la clase NeoWsRepository
    final repository = NeoWsRepository();

    // Llama a la función fetchNeoWsData con fechas de inicio y fin de ejemplo
    final result = await repository.fetchNeoWsData('2022-01-01', '2022-01-31');

    // Imprime los valores recibidos
    print('Elementos de la lista: ${result.elementCount}');
    print('Enlace propio: ${result.links?.self}');
    print('Próximo enlace: ${result.links?.next}');
    print('Enlace anterior: ${result.links?.prev}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
  });
}