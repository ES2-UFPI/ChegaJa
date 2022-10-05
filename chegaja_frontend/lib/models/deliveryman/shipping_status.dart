import 'package:flutter/material.dart';

enum ShippingStatus {
  inProgress('Em andamento', Colors.yellow, 'EM_ANDAMENTO'),
  finished('Concluída', Colors.green, 'FINALIZADA'),
  waiting('Em espera', Colors.blue, 'SOLICITADA');

  final String description;
  final Color color;
  final String code;

  const ShippingStatus(this.description, this.color, this.code);
}
