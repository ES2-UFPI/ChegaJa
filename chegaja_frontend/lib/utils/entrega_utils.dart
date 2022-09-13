class EntregaUtils {
  double calculatePriceDelivery(
      double distance, double packagesWeight, double taxe) {
    double price = 0.0;

    if (taxe < 0.0 || taxe > 1.0) {
      throw Exception("Valor de taxa inválido");
    }

    if (distance > 0.0 && distance <= 5.0) {
      price = 10.0;
    } else if (distance > 5.0 && distance <= 10.0) {
      price = 20.0;
    } else if (distance > 10.0 && distance <= 20.0) {
      price = 35.0;
    } else if (distance > 20.0 && distance <= 30.0) {
      price = 45.0;
    } else if (distance > 30.0 && distance <= 40.0) {
      price = (distance * 1.8);
    }

    price += packagesWeight;

    price += (price * taxe);

    double priceReturn = double.parse(price.toStringAsFixed(2));

    return priceReturn;
  }
}
