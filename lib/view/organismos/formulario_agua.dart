import 'package:flutter/material.dart';

import '../atomos/campo_texto.dart';
import '../moleculas/entrada_lectura.dart';

class FormularioAgua extends StatelessWidget {
  final TextEditingController cuenta;
  final TextEditingController cliente;
  final TextEditingController anterior;
  final TextEditingController actual;
  final String tipoConsumidor;
  final ValueChanged<String?> onTipoChanged;
  final String? Function(String?) validarTexto;
  final String? Function(String?) validarAnterior;
  final String? Function(String?) validarActual;

   const FormularioAgua({
    super.key,
    required this.cuenta,
    required this.cliente,
    required this.anterior,
    required this.actual,
    required this.tipoConsumidor,
    required this.onTipoChanged,
    required this.validarTexto,
    required this.validarAnterior,
    required this.validarActual,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampoTexto(
          controller: cuenta,
          label: 'Número de cuenta',
          validator: validarTexto,
          icon: Icons.receipt_long_rounded,
          keyboardType: TextInputType.number,
        ),
         SizedBox(height: 14),
        CampoTexto(
          controller: cliente,
          label: 'Nombre del cliente',
          validator: validarTexto,
          icon: Icons.person_outline_rounded,
        ),
         SizedBox(height: 14),
        EntradaLectura(
          controller: anterior,
          label: 'Lectura anterior (m³)',
          validator: validarAnterior,
        ),
         SizedBox(height: 14),
        EntradaLectura(
          controller: actual,
          label: 'Lectura actual (m³)',
          validator: validarActual,
        ),
         SizedBox(height: 14),
        DropdownButtonFormField<String>(
          initialValue: tipoConsumidor,
          decoration:  InputDecoration(
            labelText: 'Tipo de consumidor',
            prefixIcon: Icon(Icons.home_work_outlined),
          ),
          items:  [
            DropdownMenuItem(value: 'Residencial', child: Text('Residencial')),
            DropdownMenuItem(value: 'Comercial', child: Text('Comercial')),
          ],
          onChanged: onTipoChanged,
        ),
      ],
    );
  }
}
