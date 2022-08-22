import 'package:flutter_test/flutter_test.dart';

import 'package:chegaja_frontend/utils/entrega_utils.dart';

void main() {
  test('Calculate the price delivery', () {
    const distance = 11.540;

    const packagesWeight = 2.32;

    const taxe = 0.1;

    expect(
        EntregaUtils().calculatePriceDelivery(distance, packagesWeight, taxe),
        41.05);
  });
}
