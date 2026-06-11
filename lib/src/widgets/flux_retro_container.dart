import 'package:flutter/material.dart';
import 'package:flux_retro_ui/flux_retro_ui.dart';

class FluxRetroContainer extends StatelessWidget {
  const FluxRetroContainer({
    super.key,
    required this.child,
    required this.color,
    this.innerPadding,
    this.innerMargin = const .all(4),
    this.width,
    this.height,
  });

  final Widget child;
  final Color color;
  final EdgeInsets? innerPadding;
  final EdgeInsets innerMargin;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final retroTheme = context.fluxRetro;

    return Container(
      width: width,
      height: height,
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: retroTheme.shadowColor.withValues(alpha: 0.4),
            offset: const Offset(0, 6),
            blurRadius: 10,
          ),
        ],
        border: Border.all(
          color: retroTheme.shadowColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/noise_texture.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    retroTheme.glareColor.withValues(alpha: 0.05),
                    Colors.transparent,
                    retroTheme.shadowColor.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
          ),

          Container(
            margin: innerMargin,
            padding: innerPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: retroTheme.surface.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
