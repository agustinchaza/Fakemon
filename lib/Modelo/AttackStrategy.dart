import 'dart:math';

import 'package:fakemon2/Modelo/tiposPokemon.dart';


import 'Estados.dart';
import 'Fakemon.dart';

abstract class AttackStrategy {
  void attack(Fakemon attacker, Fakemon opponent);
  abstract PokemonType tipo;

  }



class ThunderboltStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    //var damage = (attacker.strong * 2 + 10) * 0.9 * (attacker.type.damageMultiplier(opponent.type));
    var damage = (attacker.strong  + 10) * 0.9 ;
    opponent.takeDamage(damage.round());
  }

  @override
  PokemonType tipo=PokemonType.electric;
}

class QuickAttackStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.4;
    opponent.takeDamage(damage.round());
  }
  @override
  PokemonType tipo=PokemonType.normal;
}

class ThunderWaveStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
   // opponent.paralyze();
  }
  @override
  PokemonType tipo=PokemonType.electric;
}

class IronTailStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    //var damage = (attacker.strong * 2 + 10) * 0.9 * (attacker.type.damageMultiplier(opponent.type));
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.3) {
      //opponent.lowerDefense();
    }
  }
  @override
  PokemonType tipo=PokemonType.steel;
}

class ScratchStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
  }
  @override
  PokemonType tipo=PokemonType.normal;
}

class EmberStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    //var damage = (attacker.strong * 2 + 10) * 0.9 * (attacker.type.damageMultiplier(opponent.type));
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.1) {
      //  opponent.burn();
    }
  }
  @override
  PokemonType tipo=PokemonType.fire;
}

class DragonRageStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    opponent.takeDamage(40);
  }
  @override
  PokemonType tipo=PokemonType.dragon;
}

class FireFangStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.9  ;
    //var damage = (attacker.level * 2 + 10) * 0.9 * (attacker.type.damageMultiplier(opponent.type));
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.2) {
      //opponent.burn();
    }
    if (Random().nextDouble() < 0.2) {
      //opponent.flinch();
    }
  }
  @override
  PokemonType tipo=PokemonType.fire;
}

class AquaJetStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    //var damage = (attacker.strong * 2 + 10) * 0.4 * (attacker.type.damageMultiplier(opponent.type));
    var damage = (attacker.strong  + 10) * 0.4 ;
    opponent.takeDamage(damage.round());
  }
  @override
  PokemonType tipo=PokemonType.water;
}

class BubbleBeamStrategy implements AttackStrategy {
  @override

  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.1) {
      //opponent.lowerSpeed();
    }
  }
  @override
  PokemonType tipo=PokemonType.water;
}



class ShadowBallStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.2) {
      // Reducir la defensa especial del oponente.
    }
  }
  @override
  PokemonType tipo = PokemonType.ghost;
}



class SludgeBombStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.3) {
      if(!opponent.estaEnvenenado){
        var veneno = Veneno();
        veneno.setPortador(opponent);
        opponent.agregarEstado(veneno);
      }
    }
  }
  @override
  PokemonType tipo = PokemonType.poison;
}



class DarkPulseStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.2) {
      // Potencialmente hacer que el oponente se flinche.
    }
  }
  @override
  PokemonType tipo = PokemonType.dark;
}


class HypnosisStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    // Intento de hacer dormir al oponente.
    if (Random().nextDouble() < 0.7) { // Hipnosis tiene una alta probabilidad de éxito.
      var dormir = Dormir();
      dormir.setPortador(opponent);
      opponent.agregarEstado(dormir);
      // Puedes imprimir un mensaje aquí indicando que el oponente ha sido afectado por Hipnosis.
    } else {
      // Puedes imprimir un mensaje aquí indicando que Hipnosis falló.
    }
  }

  @override
  PokemonType tipo = PokemonType.psychic; // Hipnosis es un movimiento psíquico.
}


class HydroPumpStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 1.2; // Alta potencia
    opponent.takeDamage(damage.round());
  }
  @override
  PokemonType tipo = PokemonType.water;
}



class PsychicStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong  + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.3) {
      // Reducir la defensa especial del oponente.
    }
  }
  @override
  PokemonType tipo = PokemonType.psychic;
}


class IceBeamStrategy implements AttackStrategy {
  @override
  void attack(Fakemon attacker, Fakemon opponent) {
    var damage = (attacker.strong + 10) * 0.9;
    opponent.takeDamage(damage.round());
    if (Random().nextDouble() < 0.1) {
      // Congelar al oponente.
    }
  }
  @override
  PokemonType tipo = PokemonType.ice;
}


