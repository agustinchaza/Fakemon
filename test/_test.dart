import 'package:flutter_test/flutter_test.dart';
import 'package:fakemon2/Modelo/RegistroJugador.dart';

void main() {
  group('RegistroJugador', () {
    test('nombre debe ser actualizado', () {
      final nuevoNombre = 'Nuevo Nombre';
      RegistroJugador.nombre = nuevoNombre;
      expect(RegistroJugador.nombre, equals(nuevoNombre));
    });




    test('selectedGenero debe ser actualizado', () {
      final nuevoSelectedGenero = <bool>[false, true];
      RegistroJugador.selectedGenero = nuevoSelectedGenero;
      expect(RegistroJugador.selectedGenero, equals(nuevoSelectedGenero));
    });
  });
}
