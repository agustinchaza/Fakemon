import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fakemon2/Modelo/ControllerBatalla.dart';


//import '../Modelo/tiposPokemon.dart';
import 'VisualFkmonTipo.dart';

class batallaUI extends StatelessWidget {
  final ControllerBatalla controladorBatalla = Get.put(ControllerBatalla());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<ControllerBatalla>(builder: (ControllerBatalla) {
      return Column(children: [
        Expanded(
            flex: 1,

              child: GestureDetector(
                onTap: controladorBatalla.botonDisponible?() {
                  // Llama a la función que deseas disparar aquí
                  // Por ejemplo, si tienes una función llamada 'dispararFuncion', sería algo así:
                  controladorBatalla.flujoDeBatalla();
                }:null,
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
                ),
              ),

        ),
        Expanded(
          flex: 2,
          child: Row(children: [
            Expanded(
                child: Column(
              children: [
                Expanded(flex: 1, child: Container()),
                Stack(
                  children: [
                    Container(
                      color: Colors.red,
                      width: 100,
                      height: 10,
                    ),
                    Container(
                      color: Colors.green,
                      width: 100 *
                          controladorBatalla.fakemonJugador.value.hp /
                          controladorBatalla.fakemonJugador.value.hpMAX,
                      height: 10,
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        'Vida: ${controladorBatalla.fakemonJugador.value.hp}/${controladorBatalla.fakemonJugador.value.hpMAX}')),
                Expanded(flex: 5, child: Container()),
                Expanded(
                    flex: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/${controladorBatalla.fakemonJugador.value.name}Espalda.gif'),
                          fit: BoxFit.fitWidth
                        ),
                      ),
                    )),
              ],
            )),
            Expanded(
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Stack(
                    children: [
                      Container(
                        color: Colors.red,
                        width: 100,
                        height: 10,
                      ),
                      Container(
                        color: Colors.green,
                        width: 100 *
                            controladorBatalla.fakemonCPU.value.hp /
                            controladorBatalla.fakemonCPU.value.hpMAX,
                        height: 10,
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          'Vida: ${controladorBatalla.fakemonCPU.value.hp}/${controladorBatalla.fakemonCPU.value.hpMAX}')),
                  Expanded(flex: 7, child: Container()),
                  Expanded(
                      flex: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/assets/${controladorBatalla.fakemonCPU.value.name}.gif'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ))
                ],
              ),
            )
          ]),
        ),
        Expanded(
            flex: 1,
            child: Column(children: [
              Expanded(
                child: (ElevatedButton(
                  onPressed: !controladorBatalla.turnoJugador.value
                      ? null
                      : () {
                          controladorBatalla.elegirAtaque(0);
                        },
                  style: ElevatedButton.styleFrom(
                    primary: getColor(controladorBatalla
                        .fakemonJugador.value.attacks[0].strategy.tipo),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(130, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controladorBatalla.fakemonJugador.value.attacks[0]
                            .strategy.runtimeType
                            .toString(),
                        style: TextStyle(
                            color: getComplementaryColor(getColor(
                                controladorBatalla.fakemonJugador.value
                                    .attacks[0].strategy.tipo)),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        getIcon(controladorBatalla
                            .fakemonJugador.value.attacks[0].strategy.tipo),
                        color: getComplementaryColor(getColor(controladorBatalla
                            .fakemonJugador.value.attacks[0].strategy.tipo)),
                        size: 30,
                      ),
                    ],
                  ),
                )),
              ),
              Expanded(
                child: (ElevatedButton(
                  onPressed:  !controladorBatalla.turnoJugador.value
                      ? null
                      : (){controladorBatalla.elegirAtaque(1);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: getColor(controladorBatalla
                        .fakemonJugador.value.attacks[1].strategy.tipo),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(130, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controladorBatalla.fakemonJugador.value.attacks[1]
                            .strategy.runtimeType
                            .toString(),
                        style: TextStyle(
                            color: getComplementaryColor(getColor(
                                controladorBatalla.fakemonJugador.value
                                    .attacks[1].strategy.tipo)),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        getIcon(controladorBatalla
                            .fakemonJugador.value.attacks[1].strategy.tipo),
                        color: getComplementaryColor(getColor(controladorBatalla
                            .fakemonJugador.value.attacks[1].strategy.tipo)),
                        size: 30,
                      ),
                    ],
                  ),
                )),
              ),
              Expanded(
                child: (ElevatedButton(
                  onPressed:
                    !controladorBatalla.turnoJugador.value
                        ? null
                        : () {controladorBatalla.elegirAtaque(2);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: getColor(controladorBatalla
                        .fakemonJugador.value.attacks[2].strategy.tipo),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(130, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controladorBatalla.fakemonJugador.value.attacks[2]
                            .strategy.runtimeType
                            .toString(),
                        style: TextStyle(
                            color: getComplementaryColor(getColor(
                                controladorBatalla.fakemonJugador.value
                                    .attacks[2].strategy.tipo)),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        getIcon(controladorBatalla
                            .fakemonJugador.value.attacks[2].strategy.tipo),
                        color: getComplementaryColor(getColor(controladorBatalla
                            .fakemonJugador.value.attacks[2].strategy.tipo)),
                        size: 30,
                      ),
                    ],
                  ),
                )),
              ),
              Expanded(
                child: (ElevatedButton(
                  onPressed:
                    !controladorBatalla.turnoJugador.value
                        ? null
                        :() {controladorBatalla.elegirAtaque(3);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: getColor(controladorBatalla
                        .fakemonJugador.value.attacks[3].strategy.tipo),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(130, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controladorBatalla.fakemonJugador.value.attacks[3]
                            .strategy.runtimeType
                            .toString(),
                        style: TextStyle(
                            color: getComplementaryColor(getColor(
                                controladorBatalla.fakemonJugador.value
                                    .attacks[3].strategy.tipo)),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        getIcon(controladorBatalla
                            .fakemonJugador.value.attacks[3].strategy.tipo),
                        color: getComplementaryColor(getColor(controladorBatalla
                            .fakemonJugador.value.attacks[3].strategy.tipo)),
                        size: 30,
                      ),
                    ],
                  ),
                )),
              )
            ]))
      ]);
    }
    )


    );
  }
}
