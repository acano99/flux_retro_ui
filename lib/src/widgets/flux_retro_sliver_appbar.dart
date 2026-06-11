import 'package:flutter/material.dart';
import 'package:flux_retro_ui/flux_retro_ui.dart';

class FluxRetroSliverAppbar extends StatelessWidget {
  const FluxRetroSliverAppbar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final retroTheme = context.fluxRetro;

    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: retroTheme.background,
      elevation: 0,
      scrolledUnderElevation: 0,

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  'assets/ic_noise_texture.png',
                  package: 'flux_retro_ui',
                  repeat: ImageRepeat.repeat,
                  fit: BoxFit.none,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 2,
                color: retroTheme.outline.withValues(alpha: 0.3),
              ),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      retroTheme.glareColor.withValues(alpha: 0.02),
                      Colors.transparent,
                      retroTheme.shadowColor.withValues(alpha: 0.1),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      title: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: retroTheme.surface,
          fontFamily: 'RetroTitle',
          package: 'flux_retro_ui',
          fontSize: 26,
          letterSpacing: 4,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: retroTheme.shadowColor,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
      ),
      actions: actions,
      centerTitle: false,
    );
  }
}
