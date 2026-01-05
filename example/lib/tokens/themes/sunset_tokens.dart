import 'package:flutter/material.dart';
import 'package:token_theme_kit/token_theme_kit.dart';

class SunsetLightTokens implements AppColorTokens {
  const SunsetLightTokens();

  @override
  BrandColors get brand => const _SunsetBrandLight();

  @override
  TextColors get text => const _SunsetTextLight();

  @override
  SurfaceColors get surface => const _SunsetSurfaceLight();

  @override
  SemanticColors get semantic => const _SunsetSemanticLight();
}

class SunsetDarkTokens implements AppColorTokens {
  const SunsetDarkTokens();

  @override
  BrandColors get brand => const _SunsetBrandDark();

  @override
  TextColors get text => const _SunsetTextDark();

  @override
  SurfaceColors get surface => const _SunsetSurfaceDark();

  @override
  SemanticColors get semantic => const _SunsetSemanticDark();
}

class _SunsetBrandLight implements BrandColors {
  const _SunsetBrandLight();

  @override
  Color get primary => const Color(0xFFEA580C);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get primaryContainer => const Color(0xFFFFEDD5);

  @override
  Color get secondary => const Color(0xFFDB2777);

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get secondaryContainer => const Color(0xFFFCE7F3);
}

class _SunsetTextLight implements TextColors {
  const _SunsetTextLight();

  @override
  Color get strong => const Color(0xFF0F172A);

  @override
  Color get body => const Color(0xFF334155);

  @override
  Color get muted => const Color(0xFF64748B);

  @override
  Color get inverse => Colors.white;

  @override
  Color get link => const Color(0xFFEA580C);
}

class _SunsetSurfaceLight implements SurfaceColors {
  const _SunsetSurfaceLight();

  @override
  Color get surface => Colors.white;

  @override
  Color get elevated => Colors.white;

  @override
  Color get border => const Color(0xFFF1F5F9);
}

class _SunsetSemanticLight implements SemanticColors {
  const _SunsetSemanticLight();

  @override
  Color get success => const Color(0xFF16A34A);

  @override
  Color get warning => const Color(0xFFF59E0B);

  @override
  Color get danger => const Color(0xFFDC2626);

  @override
  Color get info => const Color(0xFFEA580C);
}

class _SunsetBrandDark implements BrandColors {
  const _SunsetBrandDark();

  @override
  Color get primary => const Color(0xFFFB923C);

  @override
  Color get onPrimary => const Color(0xFF1F130B);

  @override
  Color get primaryContainer => const Color(0xFF3B1D0A);

  @override
  Color get secondary => const Color(0xFFF472B6);

  @override
  Color get onSecondary => const Color(0xFF1F0A14);

  @override
  Color get secondaryContainer => const Color(0xFF3A1024);
}

class _SunsetTextDark implements TextColors {
  const _SunsetTextDark();

  @override
  Color get strong => const Color(0xFFFFF7ED);

  @override
  Color get body => const Color(0xFFFED7AA);

  @override
  Color get muted => const Color(0xFFFDBA74);

  @override
  Color get inverse => const Color(0xFF0B1220);

  @override
  Color get link => const Color(0xFFFB923C);
}

class _SunsetSurfaceDark implements SurfaceColors {
  const _SunsetSurfaceDark();

  @override
  Color get surface => const Color(0xFF0B1220);

  @override
  Color get elevated => const Color(0xFF111C2E);

  @override
  Color get border => const Color(0xFF334155);
}

class _SunsetSemanticDark implements SemanticColors {
  const _SunsetSemanticDark();

  @override
  Color get success => const Color(0xFF22C55E);

  @override
  Color get warning => const Color(0xFFFBBF24);

  @override
  Color get danger => const Color(0xFFEF4444);

  @override
  Color get info => const Color(0xFFFB923C);
}
