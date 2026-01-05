import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';

abstract final class TokenColorSchemes {
  static ColorScheme fromTokens({
    required AppColorTokens token,
    required Brightness brightness,
  }) {
    final isDark = brightness == Brightness.dark;

    /// Minimal surfaces
    final surface = token.surface.surface;
    final elevated = token.surface.elevated;
    final outline = token.surface.border;

    /// ColorScheme requires inverseSurface/onInverseSurface
    final inverseSurface = isDark ? token.text.inverse : token.text.strong;
    final onInverseSurface = isDark ? token.text.strong : token.text.inverse;

    return ColorScheme(
      brightness: brightness,

      /// Primary
      primary: token.brand.primary,
      onPrimary: token.brand.onPrimary,
      primaryContainer: token.brand.primaryContainer,

      /// No token provided -> fallback
      onPrimaryContainer: token.text.strong,

      /// Secondary
      secondary: token.brand.secondary,
      onSecondary: token.brand.onSecondary,
      secondaryContainer: token.brand.secondaryContainer,

      /// No token provided -> fallback
      onSecondaryContainer: token.text.strong,

      /// Tertiary (no token group -> map to semantic.info)
      tertiary: token.semantic.info,
      onTertiary: token.text.inverse,
      tertiaryContainer: elevated,
      onTertiaryContainer: token.text.strong,

      /// Error (no onError/container tokens -> map simply)
      error: token.semantic.danger,
      onError: token.text.inverse,
      errorContainer: token.semantic.danger,
      onErrorContainer: token.text.inverse,

      /// Surface
      surface: surface,
      onSurface: token.text.strong,

      /// New M3 surface containers (derived only from surface/elevated)
      surfaceContainerLowest: surface,
      surfaceContainerLow: surface,
      surfaceContainer: surface,
      surfaceContainerHigh: elevated,
      surfaceContainerHighest: elevated,

      /// Variants/outlines
      onSurfaceVariant: token.text.body,
      outline: outline,
      outlineVariant: outline,

      /// Inverse roles
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: token.brand.primary,

      /// Surface tint (no token provided -> use primary)
      surfaceTint: token.brand.primary,
    );
  }
}
