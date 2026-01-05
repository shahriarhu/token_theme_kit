import 'package:flutter/material.dart';

import '../tokens/theme_registry.dart';
import '../tokens/typography_tokens.dart';

class TokenThemeController<T, F> extends ChangeNotifier {
  final ThemeRegistry<T> registry;
  final Map<F, AppTypographyTokens> fonts;
  final F initialFont;

  TokenThemeController({
    required this.registry,
    required this.fonts,
    required this.initialFont,
  }) : _themeId = registry.initialTheme,
       _fontId = initialFont;

  T _themeId;
  ThemeMode _mode = ThemeMode.system;
  F _fontId;

  T get themeId => _themeId;
  ThemeMode get mode => _mode;
  F get fontId => _fontId;

  void setTheme(T id) {
    _themeId = id;
    notifyListeners();
  }

  void setMode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  void setFont(F id) {
    _fontId = id;
    notifyListeners();
  }

  ThemePair get pair => registry.pairOf(_themeId);
  AppTypographyTokens get typography => fonts[_fontId]!;
}
