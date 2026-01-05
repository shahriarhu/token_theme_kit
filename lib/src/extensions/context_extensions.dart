import 'package:flutter/material.dart';
import 'package:token_theme_kit/token_theme_kit.dart';

extension TokenThemeContextX on BuildContext {
  AppColorTokens get tokens => TokenScope.of(this);

  ColorScheme get scheme => Theme.of(this).colorScheme;
}
