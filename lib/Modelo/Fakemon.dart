import 'dart:math';

//import 'package:fakemon2/Modelo/tiposPokemon.dart';

import 'package:flutter/cupertino.dart';

import 'AttackStrategy.dart';
import 'Estados.dart';
// Creamos una clase que representa un ataque
class Attack {
  final String name;

  final AttackStrategy strategy;

  Attack({required this.name, required this.strategy});
}

// La clase Fakemon utiliza una lista de ataques
class Fakemon extends ChangeNotifier {
  final String name;
  //final PokemonType type;
   int defensa;
   int strong;
   int hpMAX;
   int hp;
   int speed;
  final List<Attack> attacks;
   Set<Estado> estados={}; // uso un set para que no se repitan estados diferentes
   bool estaDormido=false;
  bool estaParalizado=false;
  bool estaConfundido=false;
  bool estaEnvenenado=false;


  Fakemon (
      {required this.strong,
      required this.speed,
      required this.name,
      //required this.type,
      required this.defensa,
      required this.hp,
      required this.attacks,
      required this.hpMAX,


      });

  //segunda version del constructor




  String attack(Fakemon opponent, int attackIndex) {
    // Verificamos que el índice del ataque sea válido
      if (attackIndex < 0 || attackIndex >= attacks.length) {
      throw ArgumentError('Invalid attack index');
    }

    int vidaInicial=opponent.hp;

    // Obtenemos el ataque correspondiente al índice y lo usamos
    var attack = attacks[attackIndex];
    attack.strategy.attack(this, opponent);

    return '$name uso ${attack.name} sobre ${opponent.name}. Este perdio ${vidaInicial-opponent.hp} puntos de vida';

  }

  int takeDamage(int damage) {


    //exponencial negativa, (simil ciclo de descarga de capacitores)
    // reduce en 0% para una defensa de 0,
    // 63% para una defensa de 100
    // y 99% para una defensa de 500

    damage= (damage*pow(e,(-defensa/100))).round();

    hp -= damage;

    if (hp<0){
      hp=0;
    }



  notifyListeners(); //no me acuerdo xq esta esto
                      //asuno que esto forma parte de un observer viejo que no termino
                      //de ser implementado
  return damage;
  }

  void takeCuracion(int curacion){
    hp+= curacion;
    if (hpMAX<hp) {
      hp=hpMAX;
    }
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

  Fakemon clonar() {
    return Fakemon(
      name: this.name,
      strong: this.strong,
      speed: this.speed,
      defensa: this.defensa,
      hp: this.hp,
      hpMAX: this.hpMAX,
      attacks: List<Attack>.from(this.attacks),

    );
  }

}

