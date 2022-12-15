class Formatters {
  static String formatToReal(double value) {
    String formatedValue = value.toStringAsFixed(2).replaceFirst('.', ',');

    return "R\$ $formatedValue";
  }
}
