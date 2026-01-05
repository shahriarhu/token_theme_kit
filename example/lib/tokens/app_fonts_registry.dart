import 'package:google_fonts/google_fonts.dart';
import 'package:token_theme_kit/token_theme_kit.dart';

enum AppFontId { inter, poppins, merriweather, jetBrainsMono }

final appFonts = <AppFontId, AppTypographyTokens>{
  AppFontId.inter: AppTypographyTokens(
    apply: GoogleFonts.interTextTheme,
    applyMono: GoogleFonts.jetBrainsMonoTextTheme,
  ),
  AppFontId.poppins: AppTypographyTokens(
    apply: GoogleFonts.poppinsTextTheme,
    applyMono: GoogleFonts.jetBrainsMonoTextTheme,
  ),
  AppFontId.merriweather: AppTypographyTokens(
    apply: GoogleFonts.merriweatherTextTheme,
    applyMono: GoogleFonts.jetBrainsMonoTextTheme,
  ),
  AppFontId.jetBrainsMono: AppTypographyTokens(
    apply: GoogleFonts.jetBrainsMonoTextTheme,
    applyMono: GoogleFonts.jetBrainsMonoTextTheme,
  ),

  /// ✅ Use asset/system font families (no GoogleFonts needed).
  /// AppFontId.interAssets: AppTypographyTokens.families(
  ///   fontFamily: 'Inter',
  ///   fallback: ['Roboto', 'NotoSans'],
  ///   monoFamily: 'JetBrainsMono',
  /// ),
};
