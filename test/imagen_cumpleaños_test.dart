import 'package:final_boss/repositories/ImagenCumpleanosRepository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test fetchImagenCumpleanosData', () async {
    // Instancia de la clase ImagenCumpleanosRepository
    final repository = ImagenCumpleanosRepository();

    // Llama a la función fetchImagenCumpleanosData con una fecha de ejemplo
    final result = await repository.fetchImagenCumpleanosData('2022-01-01');

    // Imprime el cuerpo de la respuesta
    print('Response body: ${result}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
  });
}