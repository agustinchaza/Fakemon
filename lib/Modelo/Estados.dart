import 'dart:math';

import 'Fakemon.dart';

 abstract class Estado{

  late Fakemon fakemon;
  String actuar(){return "no se implemento";}
  void limpiar(){
    fakemon.quitarEstado(this);
  }
  void setPortador(Fakemon fakemon){
    this.fakemon=fakemon;
  }
}

class Dormir extends  Estado{
  @override
  String actuar() {
    if (Random().nextDouble() < 0.5 && fakemon.estaDormido==true){
      fakemon.estaDormido=false;
      limpiar();
      return "se desperto";
    }

    fakemon.estaDormido=true;
    return "sigue dormido";

  }
}

class Paralizar extends Estado{
   @override
   String actuar(){
     if (Random().nextDouble() < 0.5 && fakemon.estaParalizado==true){
       fakemon.estaParalizado=false;
       limpiar();
       return "ya no esta paralizado";
     }
      fakemon.estaParalizado=true;
     return "sigue paralizado";
   }
}

class Confundir extends Estado{
  @override
  String actuar(){
    if (Random().nextDouble() < 0.5 && fakemon.estaParalizado==true){
      fakemon.estaParalizado=false;
      limpiar();
      return "ya no esta confundido";
    }
     fakemon.estaParalizado=true;
    return "sigue confundido";
  }
}

class Quemar extends Estado{

   late int ataqueQuitado;


   String actuar() {
     if (Random().nextDouble() < 0.5 && fakemon.estaParalizado == true) {

       limpiar();
       return "ya no esta en llamas";
     }
     fakemon.estaParalizado = true;
     int damage=fakemon.takeDamage(fakemon.hp * 0.125 as int);
     return "se quemo por QUEMADURA y recibio ${damage} de daño";
   }
   @override
  void limpiar() {

    super.limpiar();
    double ataqueADevolver=(ataqueQuitado+fakemon.strong)/fakemon.strong;
    fakemon.cambiarAtaque(ataqueADevolver);
  }

  @override
  void setPortador(Fakemon fakemon){
    super.setPortador(fakemon);
    fakemon.cambiarAtaque(0.5);
    ataqueQuitado=fakemon.strong;
  }
}





