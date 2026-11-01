import 'package:flutter/material.dart';

import '../atomos/campo_texto.dart';

class EntradaLectura extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const EntradaLectura({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      controller: controller,
      label: label,
      validator: validator,
      icon: Icons.speed_rounded,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}
