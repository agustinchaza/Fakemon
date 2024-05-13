import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modelo/tiposPokemon.dart';

Map<PokemonType, IconData> typeToIconData = {
  PokemonType.normal: Icons.circle_outlined,
  PokemonType.fire: Icons.local_fire_department,
  PokemonType.water: Icons.water_drop,
  PokemonType.electric: Icons.bolt,
  PokemonType.grass: Icons.grass,
  PokemonType.ice: Icons.ac_unit,
  PokemonType.fighting: Icons.thumb_up,
  PokemonType.poison: Icons.local_bar,
  PokemonType.ground: Icons.landscape,
  PokemonType.flying: Icons.air,
  PokemonType.psychic: Icons.bubble_chart_outlined,
  PokemonType.bug: Icons.bug_report_outlined,
  PokemonType.rock: Icons.join_inner,
  PokemonType.ghost: Icons.dark_mode_outlined,
  PokemonType.dragon: Icons.visibility,
  PokemonType.dark: Icons.nights_stay,
  PokemonType.steel: Icons.shield_outlined,
  PokemonType.fairy: Icons.wb_sunny,
};
IconData? getIcon(PokemonType tipo) {
  return typeToIconData[tipo];
}


Map<PokemonType, Color> typeToColor = {
PokemonType.normal: const Color(0xFFAAAA9A), // Light gray
PokemonType.fire: const Color(0xFFF08030), // Orange
PokemonType.water: const Color(0xFF3096FF), // Blue
PokemonType.electric: const Color(0xFFF7D02C), // Yellow
PokemonType.grass: const Color(0xFF78C850), // Green
PokemonType.ice: const Color(0xFF98D8D8), // Light blue
PokemonType.fighting: const Color(0xFFC03028), // Red
PokemonType.poison: const Color(0xFFA040A0), // Purple
PokemonType.ground: const Color(0xFF58EC53), // Light brown
PokemonType.flying: const Color(0xFFA890F0), // Lavender
PokemonType.psychic: const Color(0xFFF85888), // Pink
PokemonType.bug: const Color(0xFFA8B820), // Light green
PokemonType.rock: const Color(0xFFB8A038), // Brown
PokemonType.ghost: const Color(0xFF706898), // Dark purple
PokemonType.dragon: const Color(0xFF0060BD), // Blue (deeper shade)
PokemonType.dark: const Color(0xFF50404D), // Dark gray
PokemonType.steel: const Color(0xFFB8B8D0), // Light gray (bluish tint)
PokemonType.fairy: const Color(0xFFF0E68C), // Light yellow
};

Color getColor(PokemonType tipo) {

  return typeToColor[tipo]?? Colors.transparent;;


}

Color getComplementaryColor(Color color) {
  // Convertir el color a HSV
  final hsvColor = HSVColor.fromColor(color);

  // Calcular el tono del color complementario
  final complementaryHue = (hsvColor.hue + 180) % 360;

  // Ajustar el valor para colores claros/oscuros
  final adjustedValue = (hsvColor.value > 0.5) ? 0.4 : 0.6;

  // Devolver un nuevo color con el tono complementario y valor ajustado
  return HSVColor.fromAHSV(hsvColor.alpha, complementaryHue, hsvColor.saturation, adjustedValue).toColor();
}