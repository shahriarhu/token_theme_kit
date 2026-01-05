import 'package:flutter/material.dart';

@immutable
class AppTypographyTokens {
  /// Applies the main UI typography to a base TextTheme.
  /// Works best with GoogleFonts.*TextTheme but also supports asset/system fonts.
  final TextTheme Function(TextTheme base) apply;

  /// Applies monospace typography to a base TextTheme (optional).
  /// Intended for code blocks / ids / logs.
  final TextTheme Function(TextTheme base)? applyMono;

  const AppTypographyTokens({
    required this.apply,
    this.applyMono,
  });

  factory AppTypographyTokens.families({
    required String fontFamily,
    List<String> fallback = const [],
    String? monoFamily,
  }) {
    TextTheme applyFamily(TextTheme base, String family) {
      return base.apply(
        fontFamily: family,
        fontFamilyFallback: fallback.isEmpty ? null : fallback,
      );
    }

    return AppTypographyTokens(
      apply: (base) => applyFamily(base, fontFamily),
      applyMono: monoFamily == null ? null : (base) => applyFamily(base, monoFamily),
    );
  }
}
