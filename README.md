# 🕹️ Flux Retro UI

Paquete de interfaz de usuario para Flutter que implementa un sistema de diseño con estética retro analógica. Utiliza `ThemeExtensions` para un soporte nativo de Modo Claro y Oscuro.

## 🚀 Características

- **Estética Retro**: Efectos de textura de ruido y brillos analógicos.
- **Sistema de Temas**: Basado en `ThemeExtensions` para un acceso tipado y reactivo.
- **Componentes**: Colección de widgets (botones, tarjetas, inputs) con identidad visual coherente.

## 📂 Estructura del Paquete

- `assets/`: Recursos visuales y texturas base.
- `lib/src/theme/`: Definición de colores, tokens y extensiones del sistema.
- `lib/src/widgets/`: Catálogo de componentes visuales listos para usar.

## 🛠️ Integración

Configura las extensiones en tu `MaterialApp`:

```dart
MaterialApp(
  themeMode: ThemeMode.system,
  theme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: [FluxRetroTheme.defaultLight()],
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: [FluxRetroTheme.defaultDark()],
  ),
  home: const MyRetroScreen(),
);
```
