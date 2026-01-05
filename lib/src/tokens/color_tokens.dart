import 'dart:ui';

abstract class AppColorTokens {
  BrandColors get brand;

  TextColors get text;

  SurfaceColors get surface;

  SemanticColors get semantic;
}

abstract class BrandColors {
  Color get primary;

  Color get onPrimary;

  Color get primaryContainer;

  Color get secondary;

  Color get onSecondary;

  Color get secondaryContainer;
}

abstract class TextColors {
  Color get strong;

  Color get body;

  Color get muted;

  Color get inverse;

  Color get link;
}

abstract class SurfaceColors {
  Color get surface;

  Color get elevated;

  Color get border;
}

abstract class SemanticColors {
  Color get success;

  Color get warning;

  Color get danger;

  Color get info;
}
