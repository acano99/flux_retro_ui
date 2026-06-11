import 'package:flutter/material.dart';

import '../../flux_retro_ui.dart';

class FluxRetroIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final double padding;
  final Color? backgroundColor;

  const FluxRetroIcon({
    super.key,
    required this.icon,
    this.size = 20,
    this.color,
    this.padding = 8,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final retroTheme = context.fluxRetro;
    // Si no se pasa color de fondo, usamos un negro muy suave
    // para que parezca un botón de plástico oscuro
    final finalBgColor = backgroundColor ??
        retroTheme.shadowColor.withValues(alpha: 0.2);

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: finalBgColor,
        // Borde oscuro que da la sensación de grosor (estilo botón)
        border: Border.all(
          color: retroTheme.shadowColor.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          // Sombra proyectada (hace que sobresalga)
          BoxShadow(
            color: retroTheme.shadowColor.withValues(alpha: 0.4),
            offset: const Offset(0, 3),
            blurRadius: 4,
          ),
          // Brillo en la esquina superior izquierda (efecto relieve)
          BoxShadow(
            color: retroTheme.glareColor.withValues(alpha: 0.1),
            offset: const Offset(-1.5, -1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Añadimos un pequeño gradiente interno para que no sea un color plano
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
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
          Icon(
            icon,
            color: color ?? retroTheme.surface,
            size: size,
          ),
        ],
      ),
    );
  }
}