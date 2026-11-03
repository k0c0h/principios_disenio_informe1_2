import 'package:flutter/material.dart';

import '../atomos/campo_texto.dart';

class InicioPantalla extends StatefulWidget {
  const InicioPantalla({super.key});

  @override
  State<InicioPantalla> createState() => _InicioPantallaState();
}

class _InicioPantallaState extends State<InicioPantalla> {
  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();
  String? _errorInicio;

  void _ingresar() {
    if (_usuarioController.text.trim() != 'admin' ||
        _contrasenaController.text != '1234') {
      setState(() {
        _errorInicio = 'Usuario o contraseña incorrectos';
      });
      return;
    }

    setState(() => _errorInicio = null);
    Navigator.pushReplacementNamed(context, '/calcular');
  }

  String? _validarCampo(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.water_drop_rounded,
                      size: 64,
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'AquaControl',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Consulta tu consumo y calcula el valor de tu planilla de agua.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28),
                  CampoTexto(
                    controller: _usuarioController,
                    label: 'Usuario',
                    validator: _validarCampo,
                    icon: Icons.person_outline_rounded,
                  ),
                  SizedBox(height: 14),
                  CampoTexto(
                    controller: _contrasenaController,
                    label: 'Contraseña',
                    validator: _validarCampo,
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                  ),
                  if (_errorInicio != null) ...[
                    SizedBox(height: 12),
                    Text(
                      _errorInicio!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colors.error),
                    ),
                  ],
                  SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _ingresar,
                    icon: Icon(Icons.login_rounded),
                    label: Text('Iniciar sesión'),
                  ),
                  TextButton(
                    onPressed: () {
                      _usuarioController.clear();
                      _contrasenaController.clear();
                      setState(() => _errorInicio = null);
                    },
                    child: Text('Limpiar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
