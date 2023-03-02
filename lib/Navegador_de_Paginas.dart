import 'package:fakemon2/Menu_Inicial.dart';
import 'package:flutter/material.dart';

class Navegador_de_Paginas extends StatelessWidget {
  static final Navegador_de_Paginas _instance = Navegador_de_Paginas
      ._internal();

  factory Navegador_de_Paginas() {
    return _instance;
  }

  Navegador_de_Paginas._internal();


  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (settings) {
      return MaterialPageRoute(
        builder: (context) => Menu_Inicial(),
      );
    }
    );
  }
}