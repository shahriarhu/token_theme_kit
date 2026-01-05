# token_theme_kit

A Flutter theming package that applies design tokens to generate consistent, scalable Material
themes across your entire app.

`token_theme_kit` helps you move away from ad-hoc colors and widget overrides by introducing a *
*token-driven theming architecture**:

> **Design Tokens → ColorScheme → ThemeData → Widgets**

---

## ✨ Features

* 🎨 Token-based color system (brand, text, surface, semantic)
* 🧩 Automatic `ColorScheme` generation from tokens
* 🌗 Light / Dark theme pairs via a registry
* 🔤 Pluggable typography registry (fonts as tokens)
* 🌍 Global access to tokens via `BuildContext`
* 🧠 Centralized theme & font switching with controller
* 🧼 Clean, scalable, and Material-friendly API

---

## 📦 Installation

```yaml
dependencies:
  token_theme_kit: ^0.0.1
```

---

## 🚀 Quick Start

### 1. Define color tokens

Create token sets for your themes (example: `forest_tokens.dart`, `sunset_tokens.dart`):

```dart

const forestTokens = AppColorTokensData(
  brand: BrandColorsData(
    primary: Color(0xFF2E7D32),
    secondary: Color(0xFF81C784),
  ),
  text: TextColorsData(
    body: Colors.black87,
    strong: Colors.black,
    subtle: Colors.black54,
    disabled: Colors.black38,
  ),
  surface: SurfaceColorsData(
    background: Color(0xFFF1F8E9),
    canvas: Colors.white,
    border: Color(0xFFCBD5C0),
  ),
  semantic: SemanticColorsData(
    success: Colors.green,
    warning: Colors.orange,
    danger: Colors.red,
    info: Colors.blue,
  ),
);
```

---

### 2. Register themes

Create a theme registry that maps IDs → light/dark token pairs:

```dart

final appThemeRegistry = ThemeRegistry<AppThemeId>({
  AppThemeId.forest: ThemePair(
    light: forestTokens,
    dark: forestDarkTokens,
  ),
  AppThemeId.sunset: ThemePair(
    light: sunsetTokens,
    dark: sunsetDarkTokens,
  ),
});
```

---

### 3. Register fonts

Fonts are also tokens:

```dart

final appFontsRegistry = {
  AppFontId.inter: AppTypographyTokens.families(
    fontFamily: 'Inter',
  ),
  AppFontId.robotoMono: AppTypographyTokens.families(
    fontFamily: 'Roboto',
    monoFamily: 'RobotoMono',
  ),
};
```

---

### 4. Create a theme controller

```dart

final themeController = TokenThemeController<AppThemeId, AppFontId>(
  themes: appThemeRegistry,
  fonts: appFontsRegistry,
  initialTheme: AppThemeId.forest,
  initialFont: AppFontId.inter,
);
```

---

### 5. Wire everything in `main.dart`

```dart

return AnimatedBuilder(
  animation: themeController,
  builder: (context, _) {
    final brightness = themeController.brightness;
    final tokens = themeController.tokensFor(brightness);

    return TokenScope(
      tokens: tokens,
      child: MaterialApp(
        themeMode: themeController.mode,
        theme: TokenThemeBuilder.build(
          tokens: tokens,
          typography: themeController.typography,
          brightness: Brightness.light,
        ),
        darkTheme: TokenThemeBuilder.build(
          tokens: tokens,
          typography: themeController.typography,
          brightness: Brightness.dark,
        ),
        home: const DemoPage(),
      ),
    );
  },
);
```

---

## 🧩 Using tokens inside widgets

Access tokens anywhere via `BuildContext`:

```dart

Container(
  color: context.tokens.surface.canvas,
  child: Text(
    'Hello Tokens',
    style: TextStyle(color: context.tokens.text.strong),
  ),
);
```

You can also access the generated Material `ColorScheme`:

```dart

final scheme = context.scheme;
```

---

## 🎛 Theme & Font Switching

From anywhere (e.g. demo page):

```dart

themeController.setTheme(AppThemeId.sunset);
themeController.toggleMode();
themeController.setFont(AppFontId.robotoMono);

```

All widgets update automatically.

---

## 🧠 Why token_theme_kit?

Flutter’s default theming:

* Encourages widget-level overrides
* Becomes hard to scale
* Makes design systems difficult to enforce

`token_theme_kit`:

* Centralizes visual decisions
* Scales across large apps
* Matches how modern design systems work
* Keeps Material theming intact

---

## 🛣 Roadmap

* More Material component coverage (checkbox, switch, nav, tabs)
* Prebuilt `TokenThemeApp` wrapper
* Better dark-mode token derivations
* Persistence helpers (Hive / SharedPreferences)
* Documentation site

---

## 🧑‍💻 Author

Built with ❤️ by a Flutter developer who got tired of fighting ThemeData.

---