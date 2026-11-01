import 'package:flutter/material.dart';

import '../../model/agua_model.dart';
import '../widgets/dato_resultado.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final agua = ModalRoute.of(context)?.settings.arguments as AguaModelo?;
    if (agua == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Resultado')),
        body: Center(
          child: FilledButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/calcular'),
            child: Text('Volver al formulario'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Detalle de pago')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  DatoResultado(titulo: 'Cuenta', valor: agua.cuenta),
                  DatoResultado(titulo: 'Cliente', valor: agua.cliente),
                  DatoResultado(
                    titulo: 'Tipo de consumidor',
                    valor: agua.tipoConsumidor,
                  ),
                  DatoResultado(
                    titulo: 'Consumo',
                    valor: '${agua.consumo.toStringAsFixed(2)} m³',
                  ),
                  DatoResultado(
                    titulo: 'Tarifa aplicada',
                    valor: '\$${agua.tarifa.toStringAsFixed(2)} / m³',
                  ),
                  DatoResultado(
                    titulo: 'Valor del consumo',
                    valor: '\$${agua.valorConsumo.toStringAsFixed(2)}',
                  ),
                  DatoResultado(
                    titulo: 'Cargo fijo',
                    valor: '\$${agua.cargoFijo.toStringAsFixed(2)}',
                  ),
                  DatoResultado(
                    titulo: 'Subtotal',
                    valor: '\$${agua.subtotal.toStringAsFixed(2)}',
                  ),
                  DatoResultado(
                    titulo: 'Recargo (5%)',
                    valor: '\$${agua.recargo.toStringAsFixed(2)}',
                  ),
                  Divider(),
                  DatoResultado(
                    titulo: 'Total a pagar',
                    valor: '\$${agua.total.toStringAsFixed(2)}',
                    destacado: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.edit_rounded),
            label: Text('Realizar otro cálculo'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
            child: Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
