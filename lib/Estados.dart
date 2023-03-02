import 'dart:math';

import 'Fakemon.dart';

 abstract class Estado{

  late Fakemon fakemon;
   void actuar(){}
  void limpiar(){
    fakemon.quitarEstado(this);
  }
  void setPortador(Fakemon fakemon){
    this.fakemon=fakemon;
  }
}

class Dormir extends  Estado{
  @override
  void actuar() {
    if (Random().nextDouble() < 0.5 && fakemon.estaDormido==true){
      fakemon.estaDormido=false;
      limpiar();
    }
    else fakemon.estaDormido=true;
  }
}

class Quemar extends Estado{
   @override
  void actuar(){

   }
}




