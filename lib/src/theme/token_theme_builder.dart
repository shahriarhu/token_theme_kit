import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/typography_tokens.dart';
import 'token_color_scheme.dart';

abstract final class TokenThemeBuilder {
  static ThemeData build({
    required AppColorTokens tokens,
    required AppTypographyTokens typography,
    required Brightness brightness,
  }) {
    final scheme = TokenColorSchemes.fromTokens(
      token: tokens,
      brightness: brightness,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: tokens.surface.surface,
    );

    final textTheme = typography
        .apply(base.textTheme)
        .apply(
          bodyColor: tokens.text.body,
          displayColor: tokens.text.strong,
        );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: tokens.surface.surface,
        foregroundColor: tokens.text.strong,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
      ),
    );
  }
}
