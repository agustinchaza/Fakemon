import 'AttackStrategy.dart';
import 'Fakemon.dart';

class Fakedex {
  static final Fakedex _singleton = Fakedex._internal();
  Map<String, Fakemon> _fakemons = {};

  factory Fakedex() {
    return _singleton;
  }

  Fakedex._internal();

  void addFakemon(Fakemon fakemon) {
    _fakemons[fakemon.name] = fakemon;
  }

  void removeFakemon(String name) {
    _fakemons.remove(name);
  }

  Fakemon getFakemon(String name) {

      return _fakemons[name]!.clonar();
    }

    List<String>? getKeys(){
      return _fakemons.keys as List<String>;
    }


  List<Fakemon> getAllFakemons() {
    return _fakemons.values.toList();
  }
}





void generarFakemons(){
  Fakedex lista=Fakedex();
  Fakemon gengar = Fakemon(
    name: "Gengar",
    strong: 130,
    speed: 110,
    defensa: 75,
    hp: 60,
    hpMAX: 60,
    attacks: [
      Attack(name: "SludgeBomb", strategy: SludgeBombStrategy()),
      Attack(name: "DarkPulse", strategy: DarkPulseStrategy()),
      Attack(name: "ShadowBall", strategy: ShadowBallStrategy()),
      Attack(name: "Hypnosis", strategy: HypnosisStrategy())
    ],
  );

  lista.addFakemon(gengar);


  Fakemon starmie = Fakemon(
    name: "Starmie",
    strong: 100,
    speed: 110,
    defensa: 85,
    hp: 60,
    hpMAX: 60,
    attacks: [
      Attack(name: "Hypnosis", strategy: HypnosisStrategy()),
      Attack(name: "HydroPump", strategy: HydroPumpStrategy()),
      Attack(name: "Psychic", strategy: PsychicStrategy()),
      Attack(name: "IceBeam", strategy: IceBeamStrategy())
    ],
  );

  lista.addFakemon(starmie);

  Fakemon pikachu = Fakemon(
    name: "Pikachu",
    strong: 55,
    speed: 90,
    defensa: 50,
    hp: 30,
    hpMAX: 30,
    attacks: [
      Attack(name: "Thunderbolt", strategy: ThunderboltStrategy()),
      Attack(name: "QuickAttack", strategy: QuickAttackStrategy()),
      Attack(name: "ThunderWave", strategy: ThunderWaveStrategy()),
      Attack(name: "IronTail", strategy: IronTailStrategy())
    ],
  );
  lista.addFakemon(pikachu);

}
