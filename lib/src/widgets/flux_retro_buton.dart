import 'package:flutter/material.dart';
import 'package:flux_retro_ui/flux_retro_ui.dart';

class FluxRetroButon extends StatefulWidget {
  const FluxRetroButon({
    super.key,
    required this.label,
    this.icon,
    required this.color,
    required this.onTap,
    this.width,
    required this.fontSize,
    this.borderRadius = 12,
    this.innerBorderRadius = 10,
  });

  final String label;
  final IconData? icon;
  final Color color;
  final VoidCallback onTap;
  final double? width;
  final double fontSize;
  final double borderRadius;
  final double innerBorderRadius;

  @override
  State<FluxRetroButon> createState() => _FluxRetroButonState();
}

class _FluxRetroButonState extends State<FluxRetroButon> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final retroTeme = context.fluxRetro;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 70),
        transform: Matrix4.translationValues(0, _isPressed ? 2 : 0, 0),
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: .circular(widget.borderRadius),
          border: Border.all(
            color: retroTeme.shadowColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: retroTeme.shadowColor.withValues(alpha: 0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: retroTeme.shadowColor.withValues(alpha: 0.4),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: retroTeme.glareColor.withValues(alpha: 0.1),
                    offset: const Offset(-2, -2),
                    blurRadius: 2,
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: .circular(widget.innerBorderRadius),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    'assets/noise_texture.png',
                    repeat: ImageRepeat.repeat,
                    package: 'flux_retro_ui',
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
                        retroTeme.glareColor.withValues(alpha: 0.05),
                        Colors.transparent,
                        retroTeme.shadowColor.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: retroTeme.surface.withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null)
                      Icon(widget.icon, color: retroTeme.surface, size: 20),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        widget.label.toUpperCase(),
                        style: TextStyle(
                          color: retroTeme.surface,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: widget.fontSize,
                          fontFamily: 'RetroTitle',
                          package: 'flux_retro_ui',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
