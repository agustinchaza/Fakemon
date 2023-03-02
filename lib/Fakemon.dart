import 'package:fakemon2/tiposPokemon.dart';

import 'AttackStrategy.dart';
import 'Estados.dart';
// Creamos una clase que representa un ataque
class Attack {
  final String name;

  final AttackStrategy strategy;

  Attack({required this.name, required this.strategy});
}

// La clase Fakemon utiliza una lista de ataques
class Fakemon {
  final String name;
  final PokemonType type;
   int defensa;
   int strong;
   int hp;
   int speed;
  final List<Attack> attacks;
  late Set<Estado> estados;
   bool estaDormido=false;

  Fakemon(
      {required this.strong,
      required this.speed,
      required this.name,
      required this.type,
      required this.defensa,
      required this.hp,
      required this.attacks
      });

  void attack(Fakemon opponent, int attackIndex) {
    // Verificamos que el índice del ataque sea válido
    if (attackIndex < 0 || attackIndex >= attacks.length) {
      throw ArgumentError('Invalid attack index');
    }

    // Obtenemos el ataque correspondiente al índice y lo usamos
    var attack = attacks[attackIndex];
    attack.strategy.attack(this, opponent);
  }

  void takeDamage(int damage) {
    hp -= damage;
    if (hp < 0) {
      hp = 0;
    }
  }

  void takeCuracion(int curacion){
    hp+= curacion;
  }

  void cambiarAtaque (double proporcion){
    strong=((strong as double) *proporcion) as int;
  }

  void cambiarVelocidad (double proporcion){
    speed=((speed as double) *proporcion) as int;
  }

  void cambiarDefensa (double proporcion){
    defensa=((defensa as double) *proporcion) as int;
  }

  void agregarEstado(Estado estado){
    estados.add(estado);
  }

  void quitarEstado(Estado estado){
   estados.remove(estado);
  }



  bool isFainted() {
    return hp == 0;
  }
}

