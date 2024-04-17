import 'package:fakemon2/Modelo/fakedex.dart';

import 'Fakemon.dart';

class RegistroJugador{
  static String _nombre='ppp';
  static List<bool> _selectedGenero = <bool>[true, false];
  static String _profesion='Estudiante';
  static int edad=0;

  static String get nombre => _nombre;

  static Fakemon _fJugador = Null as Fakemon;
  static Fakemon _fCPU = Null as Fakemon;

  static Fakemon get fCPU => _fCPU;

  static set fCPU(Fakemon value) {
    _fCPU = value;
  }

  static Fakemon get fJugador => _fJugador;

  static set fJugador(Fakemon value) {
    _fJugador = value;
  }

  static set nombre(String value) {
    print('value');
    _nombre = value;
    print('nombre');
  }

  static List<bool> get selectedGenero => _selectedGenero;

  static String get profesion => _profesion;

  static set profesion(String value) {
    _profesion = value;
  }

  static set selectedGenero(List<bool> value) {
    _selectedGenero = value;
  }
}