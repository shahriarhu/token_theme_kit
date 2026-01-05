import 'package:flutter/material.dart';
import 'package:token_theme_kit/token_theme_kit.dart';

import 'tokens/app_fonts_registry.dart';
import 'tokens/app_theme_registry.dart';

class DemoPage extends StatelessWidget {
  final TokenThemeController<AppThemeId, AppFontId> controller;

  const DemoPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final scheme = context.scheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('token_theme_kit – Example'),
        actions: [
          PopupMenuButton<ThemeMode>(
            tooltip: 'Theme mode',
            onSelected: controller.setMode,
            itemBuilder: (_) => const [
              PopupMenuItem(value: ThemeMode.system, child: Text('System')),
              PopupMenuItem(value: ThemeMode.light, child: Text('Light')),
              PopupMenuItem(value: ThemeMode.dark, child: Text('Dark')),
            ],
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // HERO
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: tokens.surface.border),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(Icons.palette_outlined, color: scheme.onPrimary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Design Tokens → Theme → UI',
                        style: text.titleMedium?.copyWith(color: scheme.onPrimaryContainer),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'This screen proves token-based colors + font switching works across Material widgets.',
                        style: text.bodyMedium?.copyWith(color: tokens.text.body),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // SWITCHERS
          _SectionTitle(
            title: 'Theme & Font Switchers',
            subtitle: 'Changing this updates the whole app themes and fonts.',
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              ...AppThemeId.values.map((id) {
                return ChoiceChip(
                  label: Text(id.name),
                  selected: controller.themeId == id,
                  onSelected: (_) => controller.setTheme(id),
                );
              }),
            ],
          ),

          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: AppFontId.values.map((id) {
              return ChoiceChip(
                label: Text(id.name),
                selected: controller.fontId == id,
                onSelected: (_) => controller.setFont(id),
              );
            }).toList(),
          ),

          const SizedBox(height: 18),

          _SectionTitle(
            title: 'Color Swatches',
            subtitle: 'Quick validation of brand, surfaces, text, and semantic colors.',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SwatchRow(
                  title: 'Brand',
                  swatches: [
                    _Swatch(color: tokens.brand.primary, label: 'primary'),
                    _Swatch(color: tokens.brand.secondary, label: 'secondary'),
                    _Swatch(color: tokens.brand.primaryContainer, label: 'primaryContainer'),
                    _Swatch(color: tokens.brand.secondaryContainer, label: 'secondaryContainer'),
                  ],
                ),
                const SizedBox(height: 12),
                _SwatchRow(
                  title: 'Semantic',
                  swatches: [
                    _Swatch(color: tokens.semantic.success, label: 'success'),
                    _Swatch(color: tokens.semantic.warning, label: 'warning'),
                    _Swatch(color: tokens.semantic.danger, label: 'danger'),
                    _Swatch(color: tokens.semantic.info, label: 'info'),
                  ],
                ),
                const SizedBox(height: 12),
                _SwatchRow(
                  title: 'Surface',
                  swatches: [
                    _Swatch(color: tokens.surface.surface, label: 'surface'),
                    _Swatch(color: tokens.surface.elevated, label: 'elevated'),
                    _Swatch(color: tokens.surface.border, label: 'border'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          _SectionTitle(
            title: 'Tokens in UI',
            subtitle: 'No hex colors in widgets. Use context.tokens + context.scheme.',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title / strong text', style: text.titleLarge?.copyWith(color: tokens.text.strong)),
                const SizedBox(height: 6),
                Text('Body text uses selected font.', style: text.bodyMedium?.copyWith(color: tokens.text.body)),
                const SizedBox(height: 6),
                Text('Muted hint text', style: text.bodySmall?.copyWith(color: tokens.text.muted)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Link color',
                      style: text.bodyMedium?.copyWith(
                        color: tokens.text.link,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: tokens.surface.elevated,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: tokens.surface.border),
                      ),
                      child: Text('Badge', style: text.labelMedium?.copyWith(color: tokens.text.body)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          _SectionTitle(
            title: 'Material Widgets',
            subtitle: 'These are driven by ColorScheme built from tokens.',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@mail.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.flash_on_outlined),
                        label: const Text('Primary'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Outlined'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: 0.65,
                  backgroundColor: tokens.surface.border,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Text('Enable notifications', style: text.bodyMedium?.copyWith(color: tokens.text.body)),
                    ),
                    Switch(value: true, onChanged: (_) {}),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          _SectionTitle(
            title: 'Semantic States',
            subtitle: 'Success / Warning / Danger from tokens.semantic.*',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              children: [
                _StateRow(icon: Icons.check_circle_outline, label: 'Success', color: tokens.semantic.success),
                const SizedBox(height: 10),
                _StateRow(icon: Icons.warning_amber_outlined, label: 'Warning', color: tokens.semantic.warning),
                const SizedBox(height: 10),
                _StateRow(icon: Icons.error_outline, label: 'Danger', color: tokens.semantic.danger),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text.titleMedium?.copyWith(color: tokens.text.strong, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: text.bodySmall?.copyWith(color: tokens.text.muted)),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  final Color color;
  final String label;

  const _Swatch({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: t.surface.elevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: t.surface.border),
      ),
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: t.surface.border),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: text.bodySmall?.copyWith(color: t.text.body),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SwatchRow extends StatelessWidget {
  final String title;
  final List<_Swatch> swatches;

  const _SwatchRow({required this.title, required this.swatches});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text.labelLarge?.copyWith(color: t.text.strong, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Wrap(spacing: 10, runSpacing: 10, children: swatches),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: tokens.surface.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: tokens.surface.border),
      ),
      child: child,
    );
  }
}

class _StateRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StateRow({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withValues(alpha: 0.35)),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: text.bodyMedium?.copyWith(color: tokens.text.body)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: color.withValues(alpha: 0.35)),
          ),
          child: Text(
            label.toUpperCase(),
            style: text.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w700, letterSpacing: 0.4),
          ),
        ),
      ],
    );
  }
}
