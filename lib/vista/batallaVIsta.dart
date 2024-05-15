import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fakemon2/Modelo/ControllerBatalla.dart';
import 'VisualFkmonTipo.dart';

import 'package:fakemon2/Modelo/Fakemon.dart';

/// This class represents the UI for the battle screen.
class batallaUI extends StatelessWidget {
  /// The controller for the battle.
  final ControllerBatalla controladorBatalla = Get.put(ControllerBatalla());

  @override

  /// This method builds the UI for the battle screen.
  Widget build(BuildContext context) {
    return GetBuilder<ControllerBatalla>(builder: (ControllerBatalla) {
      return Column(children: [
        Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: controladorBatalla.botonDisponible
                    ? controladorBatalla.flujoDeBatalla
                    : null,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controladorBatalla.narradorDeBatalla.value,
                    style: TextStyle(
                      color: getComplementaryColor(getColor(controladorBatalla
                          .fakemonJugador.value.attacks[0].strategy.tipo)),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))),
        Expanded(
          flex: 2,
          child: Row(children: [
            Expanded(
                child: Column(
              children: [
                Expanded(flex: 1, child: Container()),
                healthBar(controladorBatalla.fakemonJugador.value),
                healthPoints(controladorBatalla.fakemonJugador.value),
                Expanded(flex: 5, child: Container()),
                fakemonImage(controladorBatalla.fakemonJugador.value, true),
              ],
            )),
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  healthBar(controladorBatalla.fakemonCPU.value),
                  healthPoints(controladorBatalla.fakemonCPU.value),
                  Expanded(flex: 7, child: Container()),
                  fakemonImage(controladorBatalla.fakemonCPU.value, false),
                ],
              ),
            )
          ]),
        ),
        Expanded(
            flex: 1,
            child: Column(children: [
              attackButton(0),
              attackButton(1),
              attackButton(2),
              attackButton(3),      ]))
      ]);
    });
  }

  /// This method creates a health bar widget for a given Fakemon.
  Widget healthBar(Fakemon fakemon) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
          width: 100,
          height: 10,
        ),
        Container(
          color: Colors.green,
          width: 100 * fakemon.hp / fakemon.hpMAX,
          height: 10,
        ),
      ],
    );
  }

  /// This method creates a health points widget for a given Fakemon.
  Widget healthPoints(Fakemon fakemon) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('Vida: ${fakemon.hp}/${fakemon.hpMAX}'));
  }

  /// This method creates a Fakemon image widget for a given Fakemon.
  Widget fakemonImage(Fakemon fakemon, bool isPlayer) {
    return Expanded(
        flex: 10,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'lib/assets/${fakemon.name}${isPlayer ? "Espalda" : ""}.gif'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ));
  }

  /// This method creates an attack button widget for a given attack index.
  Widget attackButton(int index) {
    return Expanded(
      child: (ElevatedButton(
        onPressed: !controladorBatalla.turnoJugador.value
            ? null
            : () {
                controladorBatalla.elegirAtaque(index);
              },
        style: ElevatedButton.styleFrom(
          primary: getColor(controladorBatalla
              .fakemonJugador.value.attacks[index].strategy.tipo),
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(130, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controladorBatalla
                  .fakemonJugador.value.attacks[index].strategy.runtimeType
                  .toString(),
              style: TextStyle(
                  color: getComplementaryColor(getColor(controladorBatalla
                      .fakemonJugador.value.attacks[index].strategy.tipo)),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
      ),

            Icon(
              getIcon(controladorBatalla
                  .fakemonJugador.value.attacks[index].strategy.tipo),
              color: getComplementaryColor(getColor(controladorBatalla
                  .fakemonJugador.value.attacks[index].strategy.tipo)),
              size: 30,
            ),
          ],
        ),
      )),
    );
  }
}
