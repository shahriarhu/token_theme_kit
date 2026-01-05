import 'package:flutter/foundation.dart';

import 'color_tokens.dart';

@immutable
class ThemePair {
  final AppColorTokens light;
  final AppColorTokens dark;

  const ThemePair({required this.light, required this.dark});
}

/// User supplies a map of themes (any enum/string key they want).
@immutable
class ThemeRegistry<T> {
  final Map<T, ThemePair> themes;
  final T initialTheme;

  const ThemeRegistry({
    required this.themes,
    required this.initialTheme,
  });

  ThemePair pairOf(T id) => themes[id]!;
}
