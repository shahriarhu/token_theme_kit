import 'package:flutter/material.dart';
import 'package:token_theme_kit/token_theme_kit.dart';

class ForestLightTokens implements AppColorTokens {
  const ForestLightTokens();

  @override
  BrandColors get brand => const _ForestBrandLight();

  @override
  TextColors get text => const _ForestTextLight();

  @override
  SurfaceColors get surface => const _ForestSurfaceLight();

  @override
  SemanticColors get semantic => const _ForestSemanticLight();
}

class ForestDarkTokens implements AppColorTokens {
  const ForestDarkTokens();

  @override
  BrandColors get brand => const _ForestBrandDark();

  @override
  TextColors get text => const _ForestTextDark();

  @override
  SurfaceColors get surface => const _ForestSurfaceDark();

  @override
  SemanticColors get semantic => const _ForestSemanticDark();
}

class _ForestBrandLight implements BrandColors {
  const _ForestBrandLight();

  @override
  Color get primary => const Color(0xFF15803D);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get primaryContainer => const Color(0xFFDCFCE7);

  @override
  Color get secondary => const Color(0xFF0EA5E9);

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get secondaryContainer => const Color(0xFFE0F2FE);
}

class _ForestTextLight implements TextColors {
  const _ForestTextLight();

  @override
  Color get strong => const Color(0xFF0F172A);

  @override
  Color get body => const Color(0xFF334155);

  @override
  Color get muted => const Color(0xFF64748B);

  @override
  Color get inverse => Colors.white;

  @override
  Color get link => const Color(0xFF15803D);
}

class _ForestSurfaceLight implements SurfaceColors {
  const _ForestSurfaceLight();

  @override
  Color get surface => Colors.white;

  @override
  Color get elevated => Colors.white;

  @override
  Color get border => const Color(0xFFE2E8F0);
}

class _ForestSemanticLight implements SemanticColors {
  const _ForestSemanticLight();

  @override
  Color get success => const Color(0xFF16A34A);

  @override
  Color get warning => const Color(0xFFF59E0B);

  @override
  Color get danger => const Color(0xFFDC2626);

  @override
  Color get info => const Color(0xFF0EA5E9);
}

class _ForestBrandDark implements BrandColors {
  const _ForestBrandDark();

  @override
  Color get primary => const Color(0xFF4ADE80);

  @override
  Color get onPrimary => const Color(0xFF052E16);

  @override
  Color get primaryContainer => const Color(0xFF052E16);

  @override
  Color get secondary => const Color(0xFF38BDF8);

  @override
  Color get onSecondary => const Color(0xFF001E2F);

  @override
  Color get secondaryContainer => const Color(0xFF0B2A4A);
}

class _ForestTextDark implements TextColors {
  const _ForestTextDark();

  @override
  Color get strong => const Color(0xFFF8FAFC);

  @override
  Color get body => const Color(0xFFCBD5E1);

  @override
  Color get muted => const Color(0xFF94A3B8);

  @override
  Color get inverse => const Color(0xFF0B1220);

  @override
  Color get link => const Color(0xFF4ADE80);
}

class _ForestSurfaceDark implements SurfaceColors {
  const _ForestSurfaceDark();

  @override
  Color get surface => const Color(0xFF0B1220);

  @override
  Color get elevated => const Color(0xFF111C2E);

  @override
  Color get border => const Color(0xFF334155);
}

class _ForestSemanticDark implements SemanticColors {
  const _ForestSemanticDark();

  @override
  Color get success => const Color(0xFF22C55E);

  @override
  Color get warning => const Color(0xFFFBBF24);

  @override
  Color get danger => const Color(0xFFEF4444);

  @override
  Color get info => const Color(0xFF38BDF8);
}
