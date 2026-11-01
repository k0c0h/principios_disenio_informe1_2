class AguaModelo {
  final String cuenta;
  final String cliente;
  final double lecturaAnterior;
  final double lecturaActual;
  final String tipoConsumidor;
  final double consumo;
  final double tarifa;
  final double valorConsumo;
  final double cargoFijo;
  final double subtotal;
  final double recargo;
  final double total;

  const AguaModelo({
    required this.cuenta,
    required this.cliente,
    required this.lecturaAnterior,
    required this.lecturaActual,
    required this.tipoConsumidor,
    required this.consumo,
    required this.tarifa,
    required this.valorConsumo,
    required this.cargoFijo,
    required this.subtotal,
    required this.recargo,
    required this.total,
  });
}
