// Importaciones necesarias

import 'dart:io';

import 'package:fakemon2/Modelo/RegistroJugador.dart';
import 'package:get/get.dart';

import 'AttackStrategy.dart';
import 'Fakemon.dart';
//import 'tiposPokemon.dart';

import 'dart:math';

import 'fakedex.dart';

// Controlador para la batalla
class ControllerBatalla extends GetxController {

  // Instancia de Fakedex
  Fakedex fakedex= Fakedex();

  // Observables para narración de batalla, turno y estado de la batalla
  RxString narradorDeBatalla = 'La batalla esta x comenzar'.obs;
  RxBool turnoJugador = false.obs;
  RxBool batallaTermino = false.obs;
  bool botonDisponible=true;


// Índices y Fakemons para control de la batalla
  int indiceDelSwitch = 1;
  int turnoActual = 1;
  late Fakemon fakemonLento; //as Fakemon;

  // Fakemons del jugador y CPU
  Rx<Fakemon> fakemonJugador = RegistroJugador.fJugador.obs;
  Rx<Fakemon> fakemonCPU = RegistroJugador.fCPU.obs;


  // Función para establecer los Fakemons
  setFakemons(Fakemon fakemonJugador, Fakemon fakemonCPU) {
    this.fakemonJugador.value = fakemonJugador;
    this.fakemonCPU.value = fakemonCPU;
  }


  // Función para obtener acciones de ataque
  getAcciones(int indexAttack) {
    if (!comprobarDebilitaciones(fakemonJugador.value)) {
      narradorDeBatalla.value =
          fakemonJugador.value.attack(fakemonCPU.value, indexAttack);
    }
    update();
  }

  // Función para ataque de la CPU
  ataqueCPU() {
    if (!comprobarDebilitaciones(fakemonJugador.value)) {
      var rng = Random();

      int indexAttack = rng.nextInt(fakemonCPU.value.attacks.length);
      narradorDeBatalla.value =
          fakemonCPU.value.attack(fakemonJugador.value, indexAttack);

    }
    update();


  }


  // Función para comprobar debilitaciones de un Fakemon
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
    botonDisponible=false;
    bool autollamar=false;
    bool activarBoton=false;
    print(indiceDelSwitch);
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
          autollamar = fakemonJugador.value.estados.isEmpty;
          fakemonLento = fakemonCPU.value;

        } else {
          comprobarEstados(fakemonCPU.value);
          autollamar = fakemonCPU.value.estados.isEmpty;
          fakemonLento = fakemonJugador.value;
        }
        indiceDelSwitch++;
        activarBoton=true;
        break;

      case 2:
        comprobarEstados(fakemonLento);
        autollamar = fakemonCPU.value.estados.isEmpty;
        indiceDelSwitch++;
        activarBoton=true;
        break;

      case 3:
        if (fakemonJugador.value.speed > fakemonCPU.value.speed) {
          turnoPlayer();
          fakemonLento = fakemonCPU.value;
        } else {
          turnoCPU();
          fakemonLento = fakemonJugador.value;
          activarBoton=true;
        }

        indiceDelSwitch++;
        break;

      case 4:

        if (fakemonLento==fakemonJugador) {
          turnoPlayer();

        } else {
          turnoCPU();

          activarBoton=true;
        }

        indiceDelSwitch = 1; //reiniciar el ciclo
        break;
      default:
        narradorDeBatalla.value = 'El programa fallo, error 1';
        break;
    }

update();

    if (fakemonJugador.value.hp <= 0) {
      sleep(const Duration(seconds: 2));
      narradorDeBatalla.value =
          'el Fakemon ${fakemonJugador.value.name} se debilito y a perdido la batalla. ${fakemonCPU.value.name} es el ganador!';
      batallaTermino.value = true;
    } else if (fakemonCPU.value.hp <= 0) {
      sleep(const Duration(seconds: 2));
      narradorDeBatalla.value =
          'el Fakemon ${fakemonCPU.value.name} se debilito y a perdido la batalla. ${fakemonJugador.value.name} es el ganador!';
      batallaTermino.value = true;
    }


    update();

    if(autollamar){
      flujoDeBatalla();
    }
    else {
      botonDisponible = activarBoton;
      if(batallaTermino.value){
        botonDisponible=false;
      }
      update();
    }
  }

  void comprobarEstados(Fakemon f) {


    for (var estado in f.estados) {
      setNarrador("el fakemon" + f.name+  estado.actuar());
      if (comprobarVida()) break;
    }

  }

  void elegirAtaque(int index) {
    fakemonJugador.value.attacks[index].strategy
        .attack(fakemonJugador.value, fakemonCPU.value);
    turnoJugador.value = false;
    update();
    botonDisponible=true;
  }

  void turnoPlayer() {
    narradorDeBatalla.value =
        'Es el turno de ${fakemonJugador.value.name}. Elije un ataque';
    turnoJugador.value = true;
    update();
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
    sleep(const Duration(seconds: 3));


  }


  ControllerBatalla() {

  }
}
