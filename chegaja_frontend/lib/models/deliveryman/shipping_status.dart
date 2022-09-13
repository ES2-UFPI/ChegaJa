import 'package:flutter/material.dart';

enum ShippingStatus {
  inProgress('Em andamento', Colors.yellow),
  finished('Concluída', Colors.green),
  waiting('Em espera', Colors.blue);

  final String description;
  final Color color;

  const ShippingStatus(this.description, this.color);
}
