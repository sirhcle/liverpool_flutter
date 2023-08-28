import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF8112FF);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Color(0xFFE10198),
];

class AppTheme {
  final int selectedColor;

  AppTheme(
    {this.selectedColor = 5}
  ) : assert(selectedColor >= 0 && selectedColor <= (_colorThemes.length - 1), 'Colors must be between 0 and ${ _colorThemes.length }');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
