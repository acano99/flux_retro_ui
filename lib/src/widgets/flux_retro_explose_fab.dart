import 'package:flutter/material.dart';
import 'package:flux_retro_ui/flux_retro_ui.dart';

class FluxRetroExploseFab extends StatelessWidget {
  const FluxRetroExploseFab({
    super.key,
    required this.items,
    required this.isExpanded,
    required this.onPressed,
  });

  final List<FluxRetroExposeFabItem> items;
  final bool isExpanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final retroTheme = context.fluxRetro;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0, 0.2),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutBack,
                      ),
                    ),
                child: child,
              ),
            );
          },
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 12,
                    children: items,
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('fab_empty')),
        ),

        GestureDetector(
          onTap: onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: retroTheme.tertiary,
              border: Border.all(
                color: retroTheme.shadowColor.withValues(alpha: 0.5),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: retroTheme.shadowColor.withValues(alpha: 0.6),
                  offset: const Offset(4, 4),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: retroTheme.glareColor.withValues(alpha: 0.15),
                  offset: const Offset(-2, -2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: retroTheme.noiseOpacity,
                      child: Image.asset(
                        'assets/ic_noise_texture.png',
                        package: 'flux_retro_ui',
                        repeat: ImageRepeat.repeat,
                      ),
                    ),
                  ),
                  // Icono animado
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 250),
                    turns: isExpanded ? 0.375 : 0,
                    child: Icon(
                      Icons.add_rounded,
                      color: retroTheme.surface,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FluxRetroExposeFabItem extends StatelessWidget {
  const FluxRetroExposeFabItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final retroTheme = context.fluxRetro;
    final itemColor = color ?? retroTheme.secondary;

    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: retroTheme.surface,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: retroTheme.shadowColor.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: retroTheme.shadowColor.withValues(alpha: 0.3),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                color: retroTheme.background,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                letterSpacing: 1.2,
                fontFamily: 'RetroData',
              ),
            ),
          ),
          const SizedBox(width: 12),
          // ICONO CIRCULAR
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: itemColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: retroTheme.shadowColor.withValues(alpha: 0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: retroTheme.shadowColor.withValues(alpha: 0.4),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Icon(icon, size: 20, color: retroTheme.surface),
          ),
        ],
      ),
    );
  }
}
