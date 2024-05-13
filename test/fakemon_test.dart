import 'package:flutter_test/flutter_test.dart';
import 'package:fakemon2/Modelo/Fakemon.dart';
import 'package:fakemon2/Modelo/AttackStrategy.dart';
import 'package:fakemon2/Modelo/Estados.dart';

void main() {
  group('Fakemon', () {
    test('should take damage correctly', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 100,
        attacks: [],
        hpMAX: 100,
      );

      final damageTaken = fakemon.takeDamage(50);

      expect(damageTaken, 45);
      expect(fakemon.hp, 55);
    });

    test('should not have negative health after taking damage', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 30,
        attacks: [],
        hpMAX: 100,
      );

      final damageTaken = fakemon.takeDamage(50);

      expect(damageTaken, 45);
      expect(fakemon.hp, 0);
    });

    test('should heal correctly', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 50,
        attacks: [],
        hpMAX: 100,
      );

      fakemon.takeCuracion(30);

      expect(fakemon.hp, 80);
    });

    test('should not exceed maximum health when healing', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 90,
        attacks: [],
        hpMAX: 100,
      );

      fakemon.takeCuracion(30);

      expect(fakemon.hp, 100);
    });

    test('should correctly identify if fainted', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 0,
        attacks: [],
        hpMAX: 100,
      );

      expect(fakemon.isFainted(), true);
    });

    test('should correctly identify if not fainted', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 10,
        attacks: [],
        hpMAX: 100,
      );

      expect(fakemon.isFainted(), false);
    });

    test('should clone correctly', () {
      final fakemon = Fakemon(
        strong: 10,
        speed: 10,
        name: 'Test',
        defensa: 10,
        hp: 10,
        attacks: [],
        hpMAX: 100,
      );

      final clone = fakemon.clonar();

      expect(clone.name, fakemon.name);
      expect(clone.strong, fakemon.strong);
      expect(clone.speed, fakemon.speed);
      expect(clone.defensa, fakemon.defensa);
      expect(clone.hp, fakemon.hp);
      expect(clone.hpMAX, fakemon.hpMAX);
      expect(clone.attacks, fakemon.attacks);
    });
  });
}