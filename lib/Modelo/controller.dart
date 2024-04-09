import 'dart:io';

import 'package:get/get.dart';

import 'AttackStrategy.dart';
import 'Fakemon.dart';
import 'tiposPokemon.dart';

import 'dart:math';

class ControllerBatalla extends GetxController {
  RxString narradorDeBatalla = 'La batalla esta x comenzar'.obs;

  RxBool turnoJugador = false.obs;
  RxBool batallaTermino = false.obs;

  int indiceDelSwitch = 1;
  int turnoActual = 1;
  late Fakemon fakemonLento; //as Fakemon;

  //inicializacion por defecto, los valores deben ser cargados al iniciar la batalla
  Rx<Fakemon> fakemonJugador = Fakemon(
    strong: 100,
    speed: 100,
    name: 'DEFECTO',
    //type: PokemonType.fire,
    defensa: 100,
    hp: 100,
    hpMAX: 100,
    attacks: [
      Attack(name: 'ThunderBolt', strategy: ThunderboltStrategy()),
      Attack(name: 'QuickAttackStrategy', strategy: QuickAttackStrategy()),
      Attack(name: 'IronTailStrategy', strategy: IronTailStrategy()),
      Attack(name: 'EmberStrategy', strategy: EmberStrategy()),
    ],
  ).obs;

  Rx<Fakemon> fakemonCPU = Fakemon(
    strong: 100,
    speed: 100,
    name: 'DEFECTO',
    //type: PokemonType.fire,
    defensa: 100,
    hp: 100,
    hpMAX: 100,
    attacks: [],
  ).obs;

  setFakemons(Fakemon fakemonJugador, Fakemon fakemonCPU) {
    this.fakemonJugador.value = fakemonJugador;
    this.fakemonCPU.value = fakemonCPU;
  }

  getAcciones(int indexAttack) {
    if (!comprobarDebilitaciones(fakemonJugador.value)) {
      narradorDeBatalla.value =
          fakemonJugador.value.attack(fakemonCPU.value, indexAttack);
    }

    flujoDeBatalla();
  }

  ataqueCPU() {
    if (!comprobarDebilitaciones(fakemonJugador.value)) {
      var rng = Random();
      int indexAttack = rng.nextInt(fakemonCPU.value.attacks.length);
      narradorDeBatalla.value =
          fakemonCPU.value.attack(fakemonJugador.value, indexAttack);
      update();
    }
  }

  bool comprobarDebilitaciones(Fakemon fakemon) {
    if (fakemonJugador.value.estaConfundido) {
      narradorDeBatalla.value =
          'El fakemon ${fakemon.name} esta confundido y no puede atacar';
      update();
      return true;
    } else if (fakemonJugador.value.estaParalizado) {
      narradorDeBatalla.value =
          'El fakemon ${fakemon.name} esta paralizado y no puede atacar';
      update();
      return true;
    } else if (fakemonJugador.value.estaDormido) {
      narradorDeBatalla.value =
          'El fakemon ${fakemon.name} esta dormido y no puede atacar';
      update();
      return true;
    }

    return false;
  }

  bool comprobarVida() {
    if (fakemonJugador.value.hp <= 0) {
      narradorDeBatalla.value =
          'el Fakemon ${fakemonJugador.value.name} se debilito y a perdido la batalla. ${fakemonCPU.value.name} es el ganador!';
      update();
      return true;
    } else if (fakemonCPU.value.hp <= 0) {
      narradorDeBatalla.value =
          'el Fakemon ${fakemonCPU.value.name} se debilito y a perdido la batalla. ${fakemonJugador.value.name} es el ganador!';
      update();
      return true;
    }
    return false;
  }

  //todo: rearmar esto, armar una fila de acciones a realizar y a cada llamada se realiza unade las acciones
  flujoDeBatalla() {
    //switch case para las acciones a realizar
    //1. comprobar estados del pokemon mas rapido
    //2. comprobar estados del adversario
    //3. ejecutar ataque del pokemon mas rapido
    //4. ejecutar ataque del adversario

    //a cada paso se debe comprobar si el pokemon esta debilitado y sumar 1 al indice del switch
    switch (indiceDelSwitch) {
      case 1:
        if (fakemonJugador.value.speed > fakemonCPU.value.speed) {
          comprobarEstados(fakemonJugador.value);
          fakemonLento = fakemonCPU.value;
        } else {
          comprobarEstados(fakemonCPU.value);
          fakemonLento = fakemonJugador.value;
        }
        indiceDelSwitch++;
        break;

      case 2:
        comprobarEstados(fakemonLento);
        indiceDelSwitch++;
        break;

      case 3:
        if (fakemonJugador.value.speed > fakemonCPU.value.speed) {
          turnoPlayer();
          fakemonLento = fakemonCPU.value;
        } else {
          turnoCPU();
          fakemonLento = fakemonJugador.value;
        }

        indiceDelSwitch++;
        break;

      case 4:
        fakemonLento == fakemonJugador.value ? turnoPlayer() : turnoCPU();
        indiceDelSwitch = 1; //reiniciar el ciclo
        break;
      default:
        narradorDeBatalla.value = 'El programa fallo, error 1';
        break;
    }

    //TODO: esperar a recibir un stream de la v  ista para poder continuar

    if (fakemonJugador.value.hp <= 0) {
      sleep(const Duration(seconds: 5));
      narradorDeBatalla.value =
          'el Fakemon ${fakemonJugador.value.name} se debilito y a perdido la batalla. ${fakemonCPU.value.name} es el ganador!';
    } else if (fakemonCPU.value.hp <= 0) {
      sleep(const Duration(seconds: 5));
      narradorDeBatalla.value =
          'el Fakemon ${fakemonCPU.value.name} se debilito y a perdido la batalla. ${fakemonJugador.value.name} es el ganador!';
    }

    batallaTermino.value = true;
  }

  void comprobarEstados(Fakemon f) {
    for (var estado in f.estados) {
      estado.actuar();
      if (comprobarVida()) break;
    }
  }

  void elegirAtaque(int index) {
    fakemonJugador.value.attacks[index].strategy
        .attack(fakemonJugador.value, fakemonCPU.value);
    turnoJugador.value = false;
    update();
    print("hola");
  }

  void turnoPlayer() {
    narradorDeBatalla.value =
        'Es el turno de ${fakemonJugador.value.name}. Elije un ataque';
    turnoJugador.value = true;
  }

  void turnoCPU() {
    narradorDeBatalla.value = 'Es el turno de ${fakemonCPU.value.name}.';
    update();

    sleep(const Duration(seconds: 3));
    ataqueCPU();
  }

  void setNarrador(String texto){
    narradorDeBatalla.value = texto;
    update();


  }


  ControllerBatalla() {}
}
