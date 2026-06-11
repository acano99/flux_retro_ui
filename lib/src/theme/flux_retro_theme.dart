import 'package:flutter/material.dart';

class FluxRetroTheme extends ThemeExtension<FluxRetroTheme> {
  final Color background;
  final Color outline;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color warning;
  final Color error;
  final Color surface;
  final Color shadowColor;
  final double noiseOpacity;
  final Color glareColor;

  const FluxRetroTheme({
    required this.background,
    required this.outline,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.warning,
    required this.error,
    required this.surface,
    required this.shadowColor,
    required this.noiseOpacity,
    required this.glareColor,
  });

  factory FluxRetroTheme.defaultDark() => const FluxRetroTheme(
    background: Color(0xFF121210),
    outline: Color(0xFF5A5A4A),
    primary: Color(0xFF3E4F3C),
    secondary: Color(0xFF3C4F5E),
    tertiary: Color(0xFF9E5630),
    warning: Color(0xFFB87D30),
    error: Color(0xFF8B3A2B),
    surface: Color(0xFFD9C5A0),
    shadowColor: Colors.black,
    noiseOpacity: 0.05,
    glareColor: Colors.white,
  );

  factory FluxRetroTheme.defaultLight() => const FluxRetroTheme(
    background: Color(0xFFF2E8D5),
    outline: Color(0xFF8C7E6A),
    surface: Color(0xFFFFF8EA),
    primary: Color(0xFF607255),
    secondary: Color(0xFF5A7382),
    tertiary: Color(0xFFB86F45),
    warning: Color(0xFFC99645),
    error: Color(0xFFA34C3F),
    shadowColor: Color(0xFF4E4637),
    noiseOpacity: 0.03,
    glareColor: Color(0xFFFFF8EA),
  );

  @override
  FluxRetroTheme copyWith({
    Color? background,
    Color? outline,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? warning,
    Color? error,
    Color? surface,
    Color? shadowColor,
    double? noiseOpacity,
    Color? glareColor,
  }) {
    return FluxRetroTheme(
      background: background ?? this.background,
      outline: outline ?? this.outline,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      surface: surface ?? this.surface,
      shadowColor: shadowColor ?? this.shadowColor,
      noiseOpacity: noiseOpacity ?? this.noiseOpacity,
      glareColor: glareColor ?? this.glareColor,
    );
  }

  @override
  FluxRetroTheme lerp(ThemeExtension<FluxRetroTheme>? other, double t) {
    if (other is! FluxRetroTheme) return this;
    return FluxRetroTheme(
      background: Color.lerp(background, other.background, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      noiseOpacity: lerpDouble(noiseOpacity, other.noiseOpacity, t),
      glareColor: Color.lerp(glareColor, other.glareColor, t)!,
    );
  }

  double lerpDouble(double a, double b, double t) => a + (b - a) * t;
}

extension FluxRetroThemeX on BuildContext {
  FluxRetroTheme get fluxRetro =>
      Theme.of(this).extension<FluxRetroTheme>() ??
      FluxRetroTheme.defaultDark();
}
