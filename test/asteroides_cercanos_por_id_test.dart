import 'package:final_boss/repositories/NeoWsNeoRepository.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  test('Test fetchNeoWsNeoData', () async {
    // Instancia de la clase NeoWsNeoRepository
    final repository = NeoWsNeoRepository();

    // Llama a la función fetchNeoWsNeoData con un ID de ejemplo
    final result = await repository.fetchNeoWsNeoData('example_id');

    // Imprime los valores recibidos
    print('ID: ${result.id}');
    print('Referencia NEO ID: ${result.neoReferenceId}');
    print('Nombre: ${result.name}');
    print('URL NASA JPL: ${result.nasaJplUrl}');
    print('Magnitud absoluta H: ${result.absoluteMagnitudeH}');
    print('Es objeto centinela: ${result.isSentryObject}');
    print('Es potencialmente peligroso: ${result.isPotentiallyHazardousAsteroid}');
    print('Enlace propio: ${result.links?.self}');

    // Asegúrate de que la función devuelve un resultado válido
    expect(result, isNotNull);
  });
}