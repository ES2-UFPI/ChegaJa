import 'package:chegaja_frontend/models/deliveryman/shipping_status.dart';
import 'package:flutter/material.dart';

class DeliveryCard2 extends StatelessWidget {
  const DeliveryCard2({
    Key? key,
    required this.wheigthPackage,
    required this.deliveryNumber,
    required this.status,
  }) : super(key: key);

  final String deliveryNumber;
  final String wheigthPackage;
  final ShippingStatus status;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ListTile(
        trailing: Chip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          avatar: CircleAvatar(
            backgroundColor: status.color,
          ),
          label: Text(status.description,
              style: const TextStyle(color: Color(0xFFF5F5F5))),
        ),
        title: Text(
          deliveryNumber,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: Text(
          '$wheigthPackage Kg',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF262626),
          ),
        ),
      ),
    );
  }
}
