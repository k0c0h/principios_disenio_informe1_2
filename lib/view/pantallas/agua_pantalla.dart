import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/agua_viewmodel.dart';
import '../organismos/formulario_agua.dart';

class AguaPantalla extends StatefulWidget {
  const AguaPantalla({super.key});

  @override
  State<AguaPantalla> createState() => _AguaPantallaState();
}

class _AguaPantallaState extends State<AguaPantalla> {
  final _formKey = GlobalKey<FormState>();
  final _cuentaController = TextEditingController();
  final _clienteController = TextEditingController();
  final _anteriorController = TextEditingController();
  final _actualController = TextEditingController();
  String _tipoConsumidor = 'Residencial';

  @override
  void dispose() {
    _cuentaController.dispose();
    _clienteController.dispose();
    _anteriorController.dispose();
    _actualController.dispose();
    super.dispose();
  }

  String? _validarTexto(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  String? _validarLecturaAnterior(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Ingresa una lectura';
    }
    final lectura = double.tryParse(valor);
    if (lectura == null || lectura < 0) {
      return 'Ingresa un número válido';
    }
    return null;
  }

  String? _validarLecturaActual(String? valor) {
    final error = _validarLecturaAnterior(valor);
    if (error != null) {
      return error;
    }
    final anterior = double.tryParse(_anteriorController.text);
    final actual = double.parse(valor!);
    if (anterior != null && actual < anterior) {
      return 'Debe ser mayor o igual a la lectura anterior';
    }
    return null;
  }

  void _calcular() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final resultado = context.read<AguaViewModel>().calcular(
      cuenta: _cuentaController.text.trim(),
      cliente: _clienteController.text.trim(),
      lecturaAnterior: double.parse(_anteriorController.text),
      lecturaActual: double.parse(_actualController.text),
      tipoConsumidor: _tipoConsumidor,
    );
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Registro de consumo'),
        actions: [
          IconButton(
            tooltip: 'Cerrar sesión',
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
            icon:  Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding:  EdgeInsets.all(20),
          children: [
            Text(
              'Datos del medidor',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 8),
             Text('Ingresa las lecturas para conocer el valor estimado.'),
             SizedBox(height: 24),
            FormularioAgua(
              cuenta: _cuentaController,
              cliente: _clienteController,
              anterior: _anteriorController,
              actual: _actualController,
              tipoConsumidor: _tipoConsumidor,
              onTipoChanged: (valor) {
                if (valor != null) {
                  setState(() => _tipoConsumidor = valor);
                }
              },
              validarTexto: _validarTexto,
              validarAnterior: _validarLecturaAnterior,
              validarActual: _validarLecturaActual,
            ),
             SizedBox(height: 26),
            FilledButton.icon(
              onPressed: _calcular,
              icon:  Icon(Icons.calculate_rounded),
              label:  Text('Calcular valor a pagar'),
            ),
          ],
        ),
      ),
    );
  }
}
