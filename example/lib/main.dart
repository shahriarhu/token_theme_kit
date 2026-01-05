import 'package:flutter/material.dart';
import 'package:token_theme_kit/token_theme_kit.dart';

import 'demo_page.dart';
import 'tokens/app_fonts_registry.dart';
import 'tokens/app_theme_registry.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  late final controller = TokenThemeController<AppThemeId, AppFontId>(
    registry: appThemeRegistry,
    fonts: appFonts,
    initialFont: AppFontId.inter,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final pair = controller.pair;
        final typography = controller.typography;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: controller.mode,

          theme: TokenThemeBuilder.build(
            tokens: pair.light,
            typography: typography,
            brightness: Brightness.light,
          ),
          darkTheme: TokenThemeBuilder.build(
            tokens: pair.dark,
            typography: typography,
            brightness: Brightness.dark,
          ),

          // Provide tokens to context.tokens
          builder: (context, child) {
            final brightness = Theme.of(context).brightness;
            final tokens = brightness == Brightness.dark ? pair.dark : pair.light;
            return TokenScope(
              tokens: tokens,
              child: child ?? const SizedBox.shrink(),
            );
          },

          home: DemoPage(controller: controller),
        );
      },
    );
  }
}
