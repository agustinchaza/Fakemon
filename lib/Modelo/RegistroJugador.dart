import 'package:fakemon2/Modelo/fakedex.dart';

import 'Fakemon.dart';

class RegistroJugador{
  static String _nombre='ppp';
  static List<bool> _selectedGenero = <bool>[true, false];
  static String _elegido='Pikachu';

  static String get elegido => _elegido;

  static set elegido(String value) {
    _elegido = value;
  }

  static int edad=0;

  static String get nombre => _nombre;

  static Fakemon _fJugador =Fakemon(strong: 100, speed: 100, name: "default", defensa: 100, hp: 100, attacks: [] , hpMAX: 100);
  static Fakemon _fCPU =Fakemon(strong: 100, speed: 100, name: "default", defensa: 100, hp: 100, attacks: [] , hpMAX: 100);

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


  static set selectedGenero(List<bool> value) {
    _selectedGenero = value;
  }
}