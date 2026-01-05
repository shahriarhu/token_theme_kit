import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';

class TokenScope extends InheritedWidget {
  final AppColorTokens tokens;

  const TokenScope({
    super.key,
    required this.tokens,
    required super.child,
  });

  static AppColorTokens of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<TokenScope>();
    assert(scope != null, 'TokenScope not found. Wrap your app with TokenScope.');
    return scope!.tokens;
  }

  @override
  bool updateShouldNotify(TokenScope oldWidget) => tokens != oldWidget.tokens;
}
