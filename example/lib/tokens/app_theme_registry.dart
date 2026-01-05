import 'package:token_theme_kit/token_theme_kit.dart';

import 'themes/forest_tokens.dart';
import 'themes/sunset_tokens.dart';

enum AppThemeId { forest, sunset }

final appThemeRegistry = ThemeRegistry<AppThemeId>(
  initialTheme: AppThemeId.forest,
  themes: {
    AppThemeId.forest: ThemePair(
      light: ForestLightTokens(),
      dark: ForestDarkTokens(),
    ),

    AppThemeId.sunset: ThemePair(
      light: SunsetLightTokens(),
      dark: SunsetDarkTokens(),
    ),
  },
);
