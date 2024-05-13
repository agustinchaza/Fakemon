import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fakemon2/Modelo/AttackStrategy.dart';
import 'package:fakemon2/Modelo/Fakemon.dart';

class MockFakemon extends Mock implements Fakemon {
  @override
  int get strong => 5;

  @override
  bool get estaEnvenenado => false;

  @override
  int takeDamage(int? damage) {
    super.noSuchMethod(Invocation.method(#takeDamage, [damage]));
    return 0;
  }
}

void main() {
  group('AttackStrategy', () {
    MockFakemon attacker = MockFakemon();
    MockFakemon opponent = MockFakemon();

    setUp(() {
      attacker = MockFakemon();
      opponent = MockFakemon();

    });

    test('ThunderboltStrategy should cause damage', () {

      var strategy = ThunderboltStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(any));
    });

    test('QuickAttackStrategy should cause less damage', () {

      var strategy = QuickAttackStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('ThunderWaveStrategy should not cause damage', () {
      var strategy = ThunderWaveStrategy();
      strategy.attack(attacker, opponent);
      verifyNever(opponent.takeDamage(captureAny));
    });

    test('IronTailStrategy should cause damage and potentially lower defense', () {

      var strategy = IronTailStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('ScratchStrategy should cause damage', () {

      var strategy = ScratchStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('EmberStrategy should cause damage and potentially burn opponent', () {

      var strategy = EmberStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('DragonRageStrategy should cause fixed damage', () {
      var strategy = DragonRageStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(40));
    });

    test('FireFangStrategy should cause damage and potentially burn or flinch opponent', () {

      var strategy = FireFangStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('AquaJetStrategy should cause damage', () {

      var strategy = AquaJetStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('BubbleBeamStrategy should cause damage and potentially lower speed', () {

      var strategy = BubbleBeamStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('ShadowBallStrategy should cause damage and potentially lower special defense', () {

      var strategy = ShadowBallStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('SludgeBombStrategy should cause damage and potentially poison opponent', () {

      var strategy = SludgeBombStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('DarkPulseStrategy should cause damage and potentially make opponent flinch', () {

      var strategy = DarkPulseStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('HypnosisStrategy should potentially make opponent sleep', () {
      var strategy = HypnosisStrategy();
      strategy.attack(attacker, opponent);
      verifyNever(opponent.takeDamage(captureAny));
    });

    test('HydroPumpStrategy should cause high damage', () {

      var strategy = HydroPumpStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('PsychicStrategy should cause damage and potentially lower special defense', () {

      var strategy = PsychicStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

    test('IceBeamStrategy should cause damage and potentially freeze opponent', () {

      var strategy = IceBeamStrategy();
      strategy.attack(attacker, opponent);
      verify(opponent.takeDamage(captureAny));
    });

  });
}