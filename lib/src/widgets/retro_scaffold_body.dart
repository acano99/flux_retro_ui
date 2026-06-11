import 'package:flutter/material.dart';

class RetroScaffoldBody extends StatelessWidget {
  const RetroScaffoldBody({super.key, required this.child, this.sliverAppBar});

  final Widget child;
  final Widget? sliverAppBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
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

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Colors.white.withValues(alpha: 0.03),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        if (sliverAppBar != null)
          NestedScrollView(
            headerSliverBuilder: (context, _) => [sliverAppBar!],
            body: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: child,
            ),
          )
        else
          child,
      ],
    );
  }
}
