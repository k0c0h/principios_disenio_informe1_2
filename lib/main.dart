import 'package:flutter/material.dart';

import 'view/pantallas/agua_pantalla.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AquaControl',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF087EA4),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Color(0xFFF4F8FA),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Color(0xFF087EA4)),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => InicioPantalla(),
        '/calcular': (_) => AguaPantalla(),
        '/resultado': (_) => ResultadoPantalla(),
      },
    );
  }
}
