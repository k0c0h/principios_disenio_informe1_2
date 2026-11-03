import '../model/agua_model.dart';

class AguaController {
  AguaModelo calcular({
    required String cuenta,
    required String cliente,
    required double lecturaAnterior,
    required double lecturaActual,
    required String tipoConsumidor,
  }) {
    final consumo = lecturaActual - lecturaAnterior;
    final tarifa = consumo <= 15
        ? 0.40
        : consumo <= 30
        ? 0.60
        : 0.80;
    final valorConsumo = consumo * tarifa;
    final cargoFijo = tipoConsumidor == 'Comercial' ? 5.00 : 3.00;
    final subtotal = valorConsumo + cargoFijo;
    final recargo = subtotal * 0.05;

    return AguaModelo(
      cuenta: cuenta,
      cliente: cliente,
      lecturaAnterior: lecturaAnterior,
      lecturaActual: lecturaActual,
      tipoConsumidor: tipoConsumidor,
      consumo: consumo,
      tarifa: tarifa,
      valorConsumo: valorConsumo,
      cargoFijo: cargoFijo,
      subtotal: subtotal,
      recargo: recargo,
      total: subtotal + recargo,
    );
  }
}
